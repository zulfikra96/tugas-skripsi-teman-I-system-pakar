var Crypto = require('crypto-js');
let { secreet } =  require('../env')


 function bcrypt(args)
{
  let chiper_text = Crypto.AES.encrypt(args,'dsadhksajcakjdhalskcjhaljdhqiudh8133423')

  return chiper_text
}


 function bdecrypt(args)
{
    
    let bytes = Crypto.AES.decrypt(args,'dsadhksajcakjdhalskcjhaljdhqiudh8133423');
    let plain_text = bytes.toString(Crypto.enc.Utf8);
    console.log(plain_text);
    
    return plain_text
}

module.exports = { bcrypt, bdecrypt }