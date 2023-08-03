let extendXhr=extend(xhr);

xhr.open('POST', domain+'core/API/index.php', true),

extendXhr({onload:function(e) {
  console.log(/*JSON.parse*/(e.target.response))
}}),
postXhr('id=22&sc=p&scp=*&at=users&l=1');