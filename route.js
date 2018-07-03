"use strict";
const get_socket = require('socket.io')
const {
    route, 
    view,
    run,
    api,
    verifyToken
} = require('./config/server')
const request = require('request').defaults({encoding:null})
const { hostname } = require('os')
const { bcrypt, bdecrypt } = require('./config/validation')
const jwt           = require('jsonwebtoken')
const {  con }      = require('./config/database')
const formidable    = require('formidable')
const { secreet }   = require('./env')
const fs            = require('fs')
const datetime      = require('node-datetime') 
const moment = require('moment')
var nodemailer      = require('nodemailer');
var LocalStorage    = require('node-localstorage').LocalStorage
var localStorage    = new LocalStorage('./scratch')
var FCM = require('fcm-node');
var serverKey = 'AAAA_hkq4Lc:APA91bFJ4lhwJ7Y8eGnKw0j5nhqLwyH7I8cUvQXrmtuf11fsW10nVILyTVfYyAWl0968Kz3z1xT4kI5yJVyuWfF4ckn_ki_DFXxh3SKYx8N1q0cDyDFX5TkS0LnToLjkcQaStWhn9su_'; //put your server key here
var fcm = new FCM(serverKey);



// setting email service

route("/login",function(req,res){
    session.startSession(req,res,function()
    {
        if(req.methods == 'GET')
        {
            view(req,res,"./views/auth/login.html",{
                message:false
            })
        }
        if(req.methods == 'POST')
        {
            req.on('data',function(data){
                let json = qs.parse(data.toString())
    
                function selectSql()
                {
                    let sql = `SELECT * FROM user WHERE username = '${json.username}'`
                    let sql_promise = new Promise(function(resolve,reject){
                        con.query(sql,function(err,result){
                            if(err) console.log(err);
                            resolve(result)
                        })
                    })
                    return sql_promise
                }
    
                function checkPassword(password,user)
                {
                    password = bdecrypt(password)
                    
                    if(password == json.password )
                    {
                        req.session.put('users',user)
                        return true
                        
                    }else{
                        return false
                    }
                }
    
                async function main()
                {
                    let select_sql = await selectSql()
    
                    if(select_sql[0] != undefined)
                    {
                        let check_password = checkPassword(select_sql[0].password,select_sql[0])
                    }else{
                        console.log(false);
                        
                        return false
                    }
    
                    if(checkPassword)
                    {
                        console.log(true);
    
                        return true
                        
                    }else{
                        console.log(false);
    
                        return false
                    }
                }
    
                main()
                    .then(function(data){
                        if(data)
                        {
                            res.writeHead(302,{
                                Location:'/home'
                            })
                            res.end()
                        }else{
                            view(req,res,"./views/auth/login.html",{
                                message:'Maaf Password atau username anda salah'
                            })
                        }
                    })
            })
        }
    })

})

route("/logout",function(req,res){
    session.startSession(req,res,function(){
        req.session.flush()
        res.writeHead(302,{
            Location:'/login'
        })
        res.end()
    })
})

route("/register",function(req,res){
    if(req.methods == 'GET')
    {
        view(req,res,"./views/auth/register.html")
    }

    if(req.methods == 'POST')
    {
        req.on('data',function(data){
            let json = qs.parse(data.toString())
            function insertSql(...users)
            {
                let insert = {
                    username:users[0],
                    nama_lengkap:users[1],
                    password:bcrypt(users[2]),
                    level:'pasien'
                }
                let sql = `INSERT INTO user SET ?`
                let sql_promise = new Promise(function(resolve,reject){
                    con.query(sql,insert,function(err,result){
                        if(err) console.log(err);
                        resolve(result) 
                    })
                    
                })
                return sql_promise
            }

            async function main()
            {
                insertSql(json.username,json.nama_lengkap,json.password)
            }

            main()

            res.writeHead(302,{
                Location:'/login'
            })
            res.end()
        })
    }

})

route("/home",function(req,res){
    // console.log("berhasil");
    
    session.startSession(req,res,function(){
        
        console.log(Auth.user());
        
        if(Auth.user() != undefined && Auth.user().level == 'pasien')
        {
            view(req,res,"./views/home/index.html")
        }
        else{
            res.writeHead(302,{
                Location:'/login'
            })
            res.end()
        }
    })
})

route("/diagnosa",function(req,res){
    session.startSession(req,res,function(){
        if(Auth.user() != undefined && Auth.user().level == 'pasien')
        {
            if(req.methods == 'GET')
            {
                function selectKonsultasi()
                {
                    let sql = `SELECT * FROM tblkonsultasi WHERE id_pasien=${Auth.user().id} ORDER BY id DESC LIMIT 1`
                    let sql_promise = new Promise(function(resolve,reject){
                        con.query(sql,function(err,result){
                            if(err) console.log(err);
                            resolve(result)
                        })
                    })

                    return sql_promise
                }

                function selectPenyakit(idkon)
                {
                    let sql = `SELECT * FROM tblpenyakit INNER JOIN tblgejala ON tblpenyakit.gejala_id = tblgejala.idgejala WHERE idkon=${idkon}`
                    let sql_promise = new Promise(function(resolve,reject){
                        con.query(sql,function(err,result){
                            if(err) console.log(err);
                            resolve(result)
                        })
                    })
                    return sql_promise
                }

                async function main()
                {
                    let selkon = await selectKonsultasi()

                    let selpen = await selectPenyakit(selkon[0].id_gangguan)

                    return selpen
                }
                main()
                    .then(function(data){
                        console.log(data);
                        data[0].namapenyakit =  data[0].namapenyakit.toUpperCase()
                        view(req,res,"./views/diagnosa/index.html",{
                            data:data[0]
                        })

                    })
            }
        }
    })
})

route("/masukan-gejala",function(req,res){
    session.startSession(req,res,function(){
        if(Auth.user() != undefined && Auth.user().level == 'pasien')
        {
            if(req.methods == 'GET')
            {
                function selectSql()
                {
                    let sql = `SELECT * FROM tblgejala`
                    let sql_promise = new Promise(function(resolve,reject){
                        con.query(sql,function(err,result){
                            if(err) console.log(err);
                            resolve(result)
                        })
                    })
                    return sql_promise
                }
            
                async function main()
                {
                    let select_sql = await selectSql()
                    view(req,res,"./views/gejala/index.html",{
                        data:select_sql
                    })
                }
                main()
            }
        
            if(req.methods == 'POST')
            {
                req.on('data',function(data){
                    let json = qs.parse(data.toString())
                    function selectPenyakit(id)
                    {
                        let sql = `SELECT * FROM tblpenyakit WHERE gejala_id='${id}'`
                        let sql_promise = new Promise(function(resolve,reject){
                            con.query(sql,function(err,result){
                                if(err) console.log(err);
                                resolve(result)
                                console.log(result);
                                
                            })
                        })
        
                        return sql_promise
                    }
        
                    function insertPenyakit(id_penyakit)
                    {
                        let insert = {
                            id_pasien:json.id,
                            id_gangguan:`${id_penyakit}`,
                        }
        
                        let sql = `INSERT INTO tblkonsultasi SET ?`
                        let sql_promise = new Promise(function(resolve,reject){
                            con.query(sql,insert,function(err,result){
                                if(err) console.log(err);
                                resolve(result)
                            })
                        })
                        return sql_promise
                    }
        
                    async function main()
                    {
                        let select_penyakit = await selectPenyakit(json.gejala)
                        let insert_penyakit = await insertPenyakit(select_penyakit[0].idkon)
        
                        
                    }
        
                    main()
                    res.writeHead(302,{
                        Location:'/diagnosa'
                    })
                    res.end()
                })
            }
        }else{
            res.writeHead(302,{
                Location:'/login',
            })
            res.end()
        }
    })

})




// listen
var server =  run(8000, function (listen,server) {
    console.log('run 8000');
    
    let IO = get_socket(server)

    IO.on('connection',function(socket){
        console.log();
        console.log("connection");
        


        socket.on('message',function(data){
            
            
            var pastDateTime = datetime.create();
            var now = pastDateTime.format("Y-m-d H:M:S")
            console.log(now);
            let user_id = data.user_id
            data['created_at'] = now.toString()
            
            
            
            function checkGroup()
            {
                let sql_check_group_message = `SELECT * FROM group_message WHERE from_id=${data.user_id} AND to_id=${data.to_id} OR  from_id=${data.to_id} AND to_id=${data.user_id} LIMIT 1`
                let sql = new Promise(function(resolve,reject){
                    con.query(sql_check_group_message,function(err,result){
                        if(err) console.log(err);

                        if(result != undefined){
                            return  resolve(result)
                        } 

                        return resolve(result)

                    })
                })

                return sql
                
            }

            function insertGroup(from_id,to_id)
            {
                let sql_input = {
                    from_id:from_id,
                    to_id:to_id
                }
                let sql = `INSERT INTO group_message SET ?`
                let promise_sql = new Promise(function(resolve,reject){
                    con.query(sql,sql_input,function(err,result){
                        if(err) console.log(err);
                        
                        
                    })
                })
                let get_data = `SELECT * FROM group_message ORDER BY id DESC LIMIT 1`

                let get_id = new Promise(function(resolve,reject){
                    con.query(get_data,function(err,result){
                        if(err) console.log(err);
                        
                        resolve(result)
                    })
                })

                return get_id
            }

            function getGroup(from_id,to_id)
            {
                let sql = `SELECT * FROM group_message WHERE from_id=${from_id} AND to_id=${to_id} OR from_id=${to_id} AND to_id=${from_id}`

                let sql_promise = new Promise(function(resolve,reject){
                    con.query(sql,function(err,result){
                        if(err)console.log(err);
                        
                        resolve(result)
                    })
                })

                return sql_promise
            }

            function insertMessage(from_id,to_id,group_id,message)
            {
                var pastDateTime = datetime.create();
                var now = pastDateTime.format("Y-m-d H:M:S")
                let sql_input = {
                    user_id:from_id,
                    to_id:to_id,
                    group_id:group_id,
                    message:message,
                    is_exist_file:data.is_exist_file,
                }
                if(data.base64_field){
                    function makeid() {
                        var text = "";
                        var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                      
                        for (var i = 0; i < 5; i++)
                          text += possible.charAt(Math.floor(Math.random() * possible.length));
                      
                        return text;
                      }
                    let path_file = `${__dirname}/storage/public/users/${data.username}/chat`
                    if(!fs.existsSync(path_file)){
                        fs.mkdirSync(path_file)
                    }
                    let name = makeid()
                    let full_path = `${__dirname}/storage/public/users/${data.username}/chat/${name}.png`
                    fs.writeFileSync(full_path,data.base64_field,{encoding:'base64'}),
                    sql_input['path_file'] = full_path

                }   
                var sql_promise
                let sql = `INSERT INTO chat SET ?`
                let insert_count_message = `UPDATE  group_message SET count_message = count_message + 1 WHERE id=${group_id}`
                con.query(insert_count_message,function(err,result){
                    if(err)console.log(err);
                    
                })
                sql_promise = new Promise(function(resolve,reject){
                    con.query(sql,sql_input,function(err,result){
                        if(err) console.log(err);
                    
                        
                        resolve(result)
                    })
                })

                return sql_promise
            }

            async function execute()
            {
                let check_group = await checkGroup();

                if(data.message == undefined){ 
                    data.message = ''
                }
                let message;
               if(check_group[0] == undefined){
                    let insert_group = await insertGroup(data.user_id,data.to_id);
                    let insert_message = await insertMessage(data.user_id,data.to_id,insert_group[0].id,data.message)
                    data['group_id'] = insert_group[0].id
                    // console.log(insert_message);
                    message = insert_message
                }else{
                    let get_group = await getGroup(data.user_id,data.to_id)
                    data['group_id'] = get_group[0].id                   
                    let insert_message = await insertMessage(data.user_id,data.to_id,get_group[0].id,data.message)                    
                    // console.log(insert_message);
                   message = insert_message
                }
                data['chat_id'] = message.insertId;
                
                IO.sockets.emit(`receive-${data.group_id}`,data)
                IO.sockets.emit(`notification-${data.to_id}`,data)
                

                
                console.log(data.to_id);
                let sql = `SELECT * FROM users WHERE id=${data.user_id} LIMIT 1`
                // con.query(sql,function(err,result){
                //     if(err) console.log(err);
                //     let user = {
                //         target_username:result[0].username,
                //         target_user_id:data.to_id,
                //         target_group_id:data.group_id,
                //         message:data.message
                //     }
                //     request.get('http://localhost:8000/api/search/profile/photo/' + data.user_id, function (error, response, body) {
                //         if (!error && response.statusCode == 200) {
                //             let photo = new Buffer(body).toString('base64');
                            
                //             console.log(photo);
                //             user.photo = photo
                            
                //         }
                //     });
                // })
  
            }   

            execute()
                .catch(function(err){
                    console.log(err);
                    
                })
        })
        socket.on('message-file',function(data){
            var pastDateTime = datetime.create();
            var now = pastDateTime.format("Y-m-d H:M:S")
            console.log(now);
            let user_id = data.user_id
            data['created_at'] = now.toString()
            
            
            
            function checkGroup()
            {
                let sql_check_group_message = `SELECT * FROM group_message WHERE from_id=${data.user_id} AND to_id=${data.to_id} OR  from_id=${data.to_id} AND to_id=${data.user_id} LIMIT 1`
                let sql = new Promise(function(resolve,reject){
                    con.query(sql_check_group_message,function(err,result){
                        if(err) console.log(err);

                        if(result != undefined){
                            return  resolve(result)
                        } 

                        return resolve(result)

                    })
                })

                return sql
                
            }

            function insertGroup(from_id,to_id)
            {
                let sql_input = {
                    from_id:from_id,
                    to_id:to_id
                }
                let sql = `INSERT INTO group_message SET ?`
                let promise_sql = new Promise(function(resolve,reject){
                    con.query(sql,sql_input,function(err,result){
                        if(err) console.log(err);
                        
                        
                    })
                })
                let get_data = `SELECT * FROM group_message ORDER BY id DESC LIMIT 1`

                let get_id = new Promise(function(resolve,reject){
                    con.query(get_data,function(err,result){
                        if(err) console.log(err);
                        
                        resolve(result)
                    })
                })

                return get_id
            }

            function getGroup(from_id,to_id)
            {
                let sql = `SELECT * FROM group_message WHERE from_id=${from_id} AND to_id=${to_id} OR from_id=${to_id} AND to_id=${from_id}`

                let sql_promise = new Promise(function(resolve,reject){
                    con.query(sql,function(err,result){
                        if(err)console.log(err);
                        
                        resolve(result)
                    })
                })

                return sql_promise
            }

            function insertMessage(from_id,to_id,group_id,message)
            {
                var pastDateTime = datetime.create();
                var now = pastDateTime.format("Y-m-d H:M:S")
                let sql_input = {
                    user_id:from_id,
                    to_id:to_id,
                    group_id:group_id,
                    message:message,
                    is_exist_file:data.is_exist_file,
                }
                if(data.base64_field){
                    function makeid() {
                        var text = "";
                        var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                      
                        for (var i = 0; i < 5; i++)
                          text += possible.charAt(Math.floor(Math.random() * possible.length));
                      
                        return text;
                      }
                    let path_file = `${__dirname}/storage/public/users/${data.username}/chat`
                    if(!fs.existsSync(path_file)){
                        fs.mkdirSync(path_file)
                    }
                    let name = makeid()
                    let full_path = `${__dirname}/storage/public/users/${data.username}/chat/${name}.png`
                    fs.writeFileSync(full_path,data.base64_field,{encoding:'base64'}),
                    sql_input['path_file'] = full_path

                }   
                var sql_promise
                let sql = `INSERT INTO chat SET ?`
                let insert_count_message = `UPDATE  group_message SET count_message = count_message + 1 WHERE id=${group_id}`
                con.query(insert_count_message,function(err,result){
                    if(err)console.log(err);
                    
                })
                sql_promise = new Promise(function(resolve,reject){
                    con.query(sql,sql_input,function(err,result){
                        if(err) console.log(err);
                    
                        
                        resolve(result)
                    })
                })

                return sql_promise
            }

            async function execute()
            {
                let check_group = await checkGroup();

                if(data.message == undefined){
                    
                    data.message = ''
                }
                let message;
               if(check_group[0] == undefined){
                    let insert_group = await insertGroup(data.user_id,data.to_id);
                    let insert_message = await insertMessage(data.user_id,data.to_id,insert_group[0].id,data.message)
                    data['group_id'] = insert_group[0].id
                    // console.log(insert_message);
                    message = insert_message
                }else{
                    let get_group = await getGroup(data.user_id,data.to_id)
                    data['group_id'] = get_group[0].id                   
                    let insert_message = await insertMessage(data.user_id,data.to_id,get_group[0].id,data.message)                    
                    // console.log(insert_message);
                   message = insert_message
                }

                data['chat_id'] = message.insertId;
                console.log(data);

                IO.sockets.emit(`notification-${data.to_id}`,data)                
                IO.sockets.emit(`receive-${data.group_id}`,data)
            } 

            execute()
        })
        socket.on('is-read',function(data){
            IO.sockets.emit(`is-read-${data.group_id}`,data)
        })

        socket.on('comments',function(data){
            
            function insertComments()
            {
                let insert = {
                    timeline_id:data.timeline_id,
                    user_id:data.user_id,
                    comments:data.comments
                }

                let sql = `INSERT INTO comments SET ? `
                con.query(sql,insert,function(err){
                    if(err) console.log(err);
                })
            }

            insertComments()
            

            

            con.query(`SELECT * FROM comments WHERE timeline_id=${data.timeline_id} ORDER BY id DESC LIMIT 1`,function(err,result){
                if(err) console.log(err);
                data.id = result[0].id
                data.created_at = moment(result[0].created_at,'Y-m-d H:M:S').fromNow() 
                IO.sockets.emit(`receive-comments-${data.timeline_id}`,data)
            })
        })

        socket.on("new-comments",function(data){
            let sql_insert = {
                comments:data.comments,
                timeline_id:data.timeline_id,
                user_id:data.user_id
            }
            let sql = `INSERT INTO comments SET ?`
            con.query(sql,sql_insert,function(err,result){
                if(err) console.log(err);
                
            })
            let sql_count = `SELECT COUNT(id) AS comments_total FROM comments WHERE timeline_id=${data.timeline_id} AND comments_id IS NULL`
            con.query(sql_count,function(err,result){
                if(err) console.log(err);
                data.comments_total = result[0].comments_total
                IO.sockets.emit(`new-comments-${data.timeline_id}`,data)
            })
        })

        socket.on("reply-comments",function(data){
            let sql_insert = {
                comments:data.comments,
                timeline_id:data.timeline_id,
                user_id:data.user_id,
                comments_id:data.comment_id,
                
            }
            let sql = `INSERT INTO comments SET ?`
            con.query(sql,sql_insert,function(err,result){
                if(err) console.log(err); 
            })
            console.log(data);
            con.query(`SELECT * FROM comments WHERE comments_id=${data.comment_id} ORDER BY id DESC LIMIT 1`,function(err,result){
                if(err) console.log(err);
                data.id = result[0].id
                data.created_at = moment(result[0].created_at,'Y-m-d H:M:S').fromNow() 
             
                IO.sockets.emit(`reply-comments-${data.comment_id}`,data)
            })
        })

        socket.on('broadcast',function(data){
            var pastDateTime = datetime.create();
            var now = pastDateTime.format("Y-m-d H:M:S")
           
            let user_id = data.user_id
            data['created_at'] = now.toString()
            
            
            
            function checkGroup(to_id)
            {
                // console.log("user id" + data.user_id);
                
                let sql_check_group_message = `SELECT * FROM group_message WHERE from_id=${data.user_id} AND to_id=${to_id} OR  from_id=${to_id} AND to_id=${data.user_id} LIMIT 1`
                let sql = new Promise(function(resolve,reject){
                    con.query(sql_check_group_message,function(err,result){
                        if(err) console.log(err); 
                         resolve(result)
                        //  console.log("data adalah" + result[0]);
                         
                    })
                })

                return sql
                
            }

            function insertGroup(from_id,to_id)
            {
                let sql_input = {
                    from_id:from_id,
                    to_id:to_id
                }
                let sql = `INSERT INTO group_message SET ?`
                let promise_sql = new Promise(function(resolve,reject){
                    con.query(sql,sql_input,function(err,result){
                        if(err) console.log(err);
                        
                        
                    })
                })
                let get_data = `SELECT * FROM group_message ORDER BY id DESC LIMIT 1`

                let get_id = new Promise(function(resolve,reject){
                    con.query(get_data,function(err,result){
                        if(err) console.log(err);
                        
                        resolve(result)
                    })
                })

                return get_id
            }

            function getGroup(from_id,to_id)
            {
                let sql = `SELECT * FROM group_message WHERE from_id=${from_id} AND to_id=${to_id} OR from_id=${to_id} AND to_id=${from_id}`

                let sql_promise = new Promise(function(resolve,reject){
                    con.query(sql,function(err,result){
                        if(err)console.log(err);
                        
                        if(result[0] != undefined){
                            
                            return resolve(result)
                        }else {
                            result[0] = undefined
                            return resolve(result)
                        }
                    })
                })

                return sql_promise
            }

            function insertMessage(from_id,to_id,group_id,message)
            {
                var pastDateTime = datetime.create();
                var now = pastDateTime.format("Y-m-d H:M:S")
                let sql_input = {
                    user_id:from_id,
                    to_id:to_id,
                    group_id:group_id,
                    message:message,
                    is_exist_file:data.is_exist_file,
                }
                if(data.base64_field){
                    function makeid() {
                        var text = "";
                        var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                      
                        for (var i = 0; i < 5; i++)
                          text += possible.charAt(Math.floor(Math.random() * possible.length));
                      
                        return text;
                      }
                    let path_file = `${__dirname}/storage/public/users/${data.username}/chat`
                    if(!fs.existsSync(path_file)){
                        fs.mkdirSync(path_file)
                    }
                    let name = makeid()
                    let full_path = `${__dirname}/storage/public/users/${data.username}/chat/${name}.png`
                    fs.writeFileSync(full_path,data.base64_field,{encoding:'base64'}),
                    sql_input['path_file'] = full_path

                }   
                var sql_promise
                let sql = `INSERT INTO chat SET ?`
                let insert_count_message = `UPDATE  group_message SET count_message = count_message + 1 WHERE id=${group_id}`
                con.query(insert_count_message,function(err,result){
                    if(err)console.log(err);
                    
                })
                sql_promise = new Promise(function(resolve,reject){
                    con.query(sql,sql_input,function(err,result){
                        if(err) console.log(err);
                    
                        
                        resolve(result)
                    })
                })

                return sql_promise
            }

            async function send(to_id)
            {
                
                
                let check_group = await checkGroup(to_id);
                console.log(check_group[0]);
                
                if(data.message == undefined){
                    
                    data.message = ''
                }
                let message;
               if(check_group[0] == undefined){
                    let insert_group = await insertGroup(data.user_id,to_id);
                    let insert_message = await insertMessage(data.user_id,to_id,insert_group[0].id,data.message)
                    data['group_id'] = insert_group[0].id
                    // console.log(insert_message);
                    message = insert_message
                    data['id'] = message.insertId;
                    data['to_id'] = to_id
                    data['username'] = data['username']
                    data['message'] = data['message']
                    data['from_id'] = data.user_id
                    data['is_exist_file'] = data['is_exist_file']
                    data['chat_id'] = message.insertId;
                    
            

                    IO.sockets.emit(`receive-${data.group_id}`,data)
                    
                    IO.sockets.emit(`notification-${data.to_id}`,data) 
                    return   
                }else if(check_group[0] != undefined){
                    let get_group = await getGroup(data.user_id,to_id)
                    data['group_id'] = get_group[0].id                   
                    let insert_message = await insertMessage(data.user_id,to_id,get_group[0].id,data.message)                    
                    // console.log(insert_message);
                   message = insert_message
                   data['id'] = message.insertId;
                    data['to_id'] = to_id
                    data['username'] = data['username']
                    data['message'] = data['message']
                    data['from_id'] = data.user_id
                    data['is_exist_file'] = data['is_exist_file']
                    data['chat_id'] = message.insertId;
                    
            

                    IO.sockets.emit(`receive-${data.group_id}`,data)
                    
                    IO.sockets.emit(`notification-${data.to_id}`,data)  
                    return  
                }

                            
            } 

            function execute()
            {
                for (let index = 0; index < data.array_to_id.length; index++) {
                    send(data.array_to_id[index])
                    console.log(data.array_to_id[index]);    
                }
            }

            execute()
            
        })

        socket.on('broadcast-referal',function(data){
            var pastDateTime = datetime.create();
            var now = pastDateTime.format("Y-m-d H:M:S")
            console.log(data);
            let user_id = data.user_id
            data['created_at'] = now.toString()
            
            
            
            function checkGroup(to_id)
            {
                let sql_check_group_message = `SELECT * FROM group_message WHERE from_id=${data.user_id} AND to_id=${to_id} OR  from_id=${to_id} AND to_id=${data.user_id} LIMIT 1`
                let sql = new Promise(function(resolve,reject){
                    con.query(sql_check_group_message,function(err,result){
                        if(err) console.log(err);

                        if(result != undefined){
                            return  resolve(result)
                        } 

                        return resolve(result)

                    })
                })

                return sql
                
            }

            function insertGroup(from_id,to_id)
            {
                let sql_input = {
                    from_id:from_id,
                    to_id:to_id
                }
                let sql = `INSERT INTO group_message SET ?`
                let promise_sql = new Promise(function(resolve,reject){
                    con.query(sql,sql_input,function(err,result){
                        if(err) console.log(err);
                        
                        
                    })
                })
                let get_data = `SELECT * FROM group_message ORDER BY id DESC LIMIT 1`

                let get_id = new Promise(function(resolve,reject){
                    con.query(get_data,function(err,result){
                        if(err) console.log(err);
                        
                        resolve(result)
                    })
                })

                return get_id
            }

            function getGroup(from_id,to_id)
            {
                let sql = `SELECT * FROM group_message WHERE from_id=${from_id} AND to_id=${to_id} OR from_id=${to_id} AND to_id=${from_id}`

                let sql_promise = new Promise(function(resolve,reject){
                    con.query(sql,function(err,result){
                        if(err)console.log(err);
                        
                        resolve(result)
                    })
                })

                return sql_promise
            }

            function insertMessage(from_id,to_id,group_id,message)
            {
                var pastDateTime = datetime.create();
                var now = pastDateTime.format("Y-m-d H:M:S")
                let sql_input = {
                    user_id:from_id,
                    to_id:to_id,
                    group_id:group_id,
                    message:message,
                    is_exist_file:data.is_exist_file,
                }
                if(data.base64_field){
                    function makeid() {
                        var text = "";
                        var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                      
                        for (var i = 0; i < 5; i++)
                          text += possible.charAt(Math.floor(Math.random() * possible.length));
                      
                        return text;
                      }
                    let path_file = `${__dirname}/storage/public/users/${data.username}/chat`
                    if(!fs.existsSync(path_file)){
                        fs.mkdirSync(path_file)
                    }
                    let name = makeid()
                    let full_path = `${__dirname}/storage/public/users/${data.username}/chat/${name}.png`
                    fs.writeFileSync(full_path,data.base64_field,{encoding:'base64'}),
                    sql_input['path_file'] = full_path

                }   
                var sql_promise
                let sql = `INSERT INTO chat SET ?`
                let insert_count_message = `UPDATE  group_message SET count_message = count_message + 1 WHERE id=${group_id}`
                con.query(insert_count_message,function(err,result){
                    if(err)console.log(err);
                    
                })
                sql_promise = new Promise(function(resolve,reject){
                    con.query(sql,sql_input,function(err,result){
                        if(err) console.log(err);
                    
                        
                        resolve(result)
                    })
                })

                return sql_promise
            }

            async function send(to_id)
            {
                
                
                let check_group = await checkGroup(to_id);

                if(data.message == undefined){
                    
                    data.message = ''
                }
                let message;
               if(check_group[0] == undefined){
                    let insert_group = await insertGroup(data.user_id,to_id);
                    let insert_message = await insertMessage(data.user_id,to_id,insert_group[0].id,data.message)
                    data['group_id'] = insert_group[0].id
                    // console.log(insert_message);
                    message = insert_message
                }else{
                    let get_group = await getGroup(data.user_id,to_id)
                    data['group_id'] = get_group[0].id                   
                    let insert_message = await insertMessage(data.user_id,to_id,get_group[0].id,data.message)                    
                    // console.log(insert_message);
                   message = insert_message
                }

                data['id'] = message.insertId;
             
                data['to_id'] = to_id
                data['username'] = data['username']
                data['message'] = data['message']
                data['from_id'] = data.user_id
                data['is_exist_file'] = data['is_exist_file']
                console.log(data);
                
                IO.sockets.emit(`receive-${data.group_id}`,data)
                IO.sockets.emit(`notification-${data.to_id}`,data)  

            } 

            async function execute()
            {
                let sql = `SELECT * WHERE figure_id=${data.figure_id}`
                con.query(sql,function(err,result){
                    if(err) console.log(err);
                    for (const key in result) {
                        send(result[index].user_id)   
                        console.log(result[index].user_id);  
                    }
                })
            }

            execute()
        })


        socket.on("broadcast-group",function(data){
            var pastDateTime = datetime.create();
            var now = pastDateTime.format("Y-m-d H:M:S")
           
            let user_id = data.user_id
            data['created_at'] = now.toString()
            
            console.log(data);
            
            
            function checkGroup(to_id)
            {
                // console.log("user id" + data.user_id);
                
                let sql_check_group_message = `SELECT * FROM group_message WHERE from_id=${data.user_id} AND to_id=${to_id} OR  from_id=${to_id} AND to_id=${data.user_id} LIMIT 1`
                let sql = new Promise(function(resolve,reject){
                    con.query(sql_check_group_message,function(err,result){
                        if(err) console.log(err); 
                         resolve(result)
                        //  console.log("data adalah" + result[0]);
                         
                    })
                })

                return sql
                
            }

            function insertGroup(from_id,to_id)
            {
                let sql_input = {
                    from_id:from_id,
                    to_id:to_id
                }
                let sql = `INSERT INTO group_message SET ?`
                let promise_sql = new Promise(function(resolve,reject){
                    con.query(sql,sql_input,function(err,result){
                        if(err) console.log(err);
                        
                        
                    })
                })
                let get_data = `SELECT * FROM group_message ORDER BY id DESC LIMIT 1`

                let get_id = new Promise(function(resolve,reject){
                    con.query(get_data,function(err,result){
                        if(err) console.log(err);
                        
                        resolve(result)
                    })
                })

                return get_id
            }

            function getGroup(from_id,to_id)
            {
                let sql = `SELECT * FROM group_message WHERE from_id=${from_id} AND to_id=${to_id} OR from_id=${to_id} AND to_id=${from_id}`

                let sql_promise = new Promise(function(resolve,reject){
                    con.query(sql,function(err,result){
                        if(err)console.log(err);
                        
                        if(result[0] != undefined){
                            
                            return resolve(result)
                        }else {
                            result[0] = undefined
                            return resolve(result)
                        }
                    })
                })

                return sql_promise
            }

            function insertMessage(from_id,to_id,group_id,message)
            {
                var pastDateTime = datetime.create();
                var now = pastDateTime.format("Y-m-d H:M:S")
                let sql_input = {
                    user_id:from_id,
                    to_id:to_id,
                    group_id:group_id,
                    message:message,
                    is_exist_file:data.is_exist_file,
                }
                if(data.base64_field){
                    function makeid() {
                        var text = "";
                        var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                      
                        for (var i = 0; i < 5; i++)
                          text += possible.charAt(Math.floor(Math.random() * possible.length));
                      
                        return text;
                      }
                    let path_file = `${__dirname}/storage/public/users/${data.username}/chat`
                    if(!fs.existsSync(path_file)){
                        fs.mkdirSync(path_file)
                    }
                    let name = makeid()
                    let full_path = `${__dirname}/storage/public/users/${data.username}/chat/${name}.png`
                    fs.writeFileSync(full_path,data.base64_field,{encoding:'base64'}),
                    sql_input['path_file'] = full_path

                }   
                var sql_promise
                let sql = `INSERT INTO chat SET ?`
                let insert_count_message = `UPDATE  group_message SET count_message = count_message + 1 WHERE id=${group_id}`
                con.query(insert_count_message,function(err,result){
                    if(err)console.log(err);
                    
                })
                sql_promise = new Promise(function(resolve,reject){
                    con.query(sql,sql_input,function(err,result){
                        if(err) console.log(err);
                    
                        
                        resolve(result)
                    })
                })

                return sql_promise
            }

            async function send(to_id)
            {
                
                
                let check_group = await checkGroup(to_id);
                
                
                if(data.message == undefined){
                    
                    data.message = ''
                }
                let message;
               if(check_group[0] == undefined){
                    let insert_group = await insertGroup(data.user_id,to_id);
                    let insert_message = await insertMessage(data.user_id,to_id,insert_group[0].id,data.message)
                    data['group_id'] = insert_group[0].id
                    // console.log(insert_message);
                    message = insert_message
                    data['id'] = message.insertId;
                    data['to_id'] = to_id
                    data['username'] = data['username']
                    data['message'] = data['message']
                    data['from_id'] = data.user_id
                    data['is_exist_file'] = data['is_exist_file']
                    data['chat_id'] = message.insertId;
                    
            
                    console.log(data);
                    
                    IO.sockets.emit(`receive-${data.group_id}`,data)
                    
                    IO.sockets.emit(`notification-${to_id}`,data) 
                    return   
                }else if(check_group[0] != undefined){
                    let get_group = await getGroup(data.user_id,to_id)
                    data['group_id'] = get_group[0].id                   
                    let insert_message = await insertMessage(data.user_id,to_id,get_group[0].id,data.message)                    
                    // console.log(insert_message);
                   message = insert_message
                   data['id'] = message.insertId;
                    data['to_id'] = to_id
                    data['username'] = data['username']
                    data['message'] = data['message']
                    data['from_id'] = data.user_id
                    data['is_exist_file'] = data['is_exist_file']
                    
                    data['chat_id'] = message.insertId;
                    
            
                    console.log(data);
                    
                    IO.sockets.emit(`receive-${data.group_id}`,data)
                    
                    IO.sockets.emit(`notification-${to_id}`,data)  
                    return  
                }

                            
            } 

            function group(group_id)
            {
                let sql = `SELECT group_relation_message.user_id, group_message_figure.user_id AS figure_id  FROM group_message_figure INNER JOIN group_relation_message ON  group_message_figure.id = group_relation_message.group_id WHERE group_message_figure.user_id = ${data.user_id} AND group_relation_message.group_id = ${group_id}`
                con.query(sql,function(err,result){
                    if(err) console.log(err);
                    
                    
                   for(let results in result){
                        send(result[results].user_id)
                   }
                })
            }

            async function execute()
            {
                let group_id = data.group_id
                if(group_id.isArray)
                {
                    for (let index = 0; index < group_id.length; index++) {
                        group(group_id[index])
                        console.log("group id di if nya adalah " + group_id[index]);    
                    }
                }else{
                    group(group_id)
                    console.log("group id di else nya adalah " + group_id)   

                }
                
            }



            execute()
                .catch(function(err){
                    console.log(err);
                    
                })
               
        })  
    })
})