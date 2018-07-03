var transporter = nodemailer.createTransport({
    service:'gmail',
    auth:{
        user:'zulfikralahmudin@gmail.com',
        pass:'Billgates1996'
    }
})

var randomColor = function(){
    let color = [
        'F44336','B71C1C',
        'FF5252','E91E63',
        'EC407A','D81B60',
        '880E4F','9C27B0',
        '4A148C','E040FB',
        '673AB7','512DA8',
        '3F51B5','3F51B5',
        '1A237E','2196F3',
        '03A9F4','0277BD',
        '00BCD4','00838F',
        '009688','00897B',
        '4CAF50','2E7D32',
        '8BC34A','8BC34A',
        'CDDC39','C0CA33',
        'FFEB3B','F9A825',
        'FFC107','FFA000',
        'FF9800','FF9800',
        'FFFF00','FFD740',
        'FF5722','FF7043',
        '795548','795548',
        '9E9E9E','9E9E9E',
        '607D8B','546E7A'
    ]
    let random =  Math.floor((Math.random() * 44 ) + 1)
    
    return color[random]
}