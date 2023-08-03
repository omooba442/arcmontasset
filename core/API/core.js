xhr.open('POST', domain+'/core/API/handleSession.php', true),

//stores the userId of a logged in user in at user/login or /user/register
extendXhr({onload:function(e) {
  storage({key:'[RESPONSE]', value:e.target.response, prop:'set'})
  console.log('SERVER RESPONSE: from core/API/core.js', e.target.response);
}});
/* code to store username for session id lookup later 
wrapped in an IFFY to prevent name collisions
the IFFY below initiates the process of getting the user data in the first place
*/

(function(path, uname) {
  path=window.location.href.replace(domain, ''),
  ['user/register', 'user/login']
  .forEach(url=>{
    if(url===path) {
      uname = d.forms[0].username,
      d.forms[0].onsubmit = function(){
        setTimeout(() => {
          postXhr("id=''&mode=read&username="+uname.value)
        }, 2.8e3);
      };
    }
  })
})()

//core.js is available under user/trade/*
// the code below safely checks whether the userId of a logged in user was stored otherwise, It prompts the user for their user name via a <form name='getSession'>
let userId = storage({prop:'get', key:'[RESPONSE]', false:_=>{

/* for situations where the client disables caching thereby making all operations on localStorage throw errors,
fetch userId from the server psychologically asking the users for their username in order to query the database for their id and their balance
'getSession' below is made visible for this purpose

the last commit made to https://ogbotemi-2000/basefex.git involves making the site menu section visible for the below to be viable
*/
pageData.session = 
window.getSession.classList.remove('opacity-0', 'pointer-events-none');

  xhr.open('POST', domain+'/core/API/handleSession.php', true),
  postXhr("id=''&mode=read&username="+uname.value)

}})
