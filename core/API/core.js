xhr.open('POST', domain+'/core/API/sessionId.php', true),

extendXhr({onload:function(e) {
  console.log('[RESPONSE]', e.target.response),
  localStorage['balance']=e.target.response
}});
/* code to store username for session id lookup later 
wrapped in an IFFY to prevent name collisions
*/
(function(path, uname) {
  path=window.location.href.replace(domain, ''),
  ['user/register', 'user/login']
  .forEach(url=>{
    if(url===path) {
      uname = d.forms[0].username,
      d.forms[0].onsubmit = function(){
        setTimeout(() => {
          postXhr('username='+uname.value)
        }, 2e3);
      };
    }
  })
})()
