let domain = window.location.href.split(/user|admin/)[0];
let d=document, head=d.head, xhr=new XMLHttpRequest, rAF=(fn, t)=>(t==void 0?window.requestAnimationFrame||setTimeout:setTimeout)(fn, t||1000/60), ID=_=>d.getElementById(_),
extendXhr=extend(xhr);
postXhr=(payload)=>{
  ['Accept', 'application/json,*/*;q=0.1', 'Content-Type', 'application/x-www-form-urlencoded']
  .forEach((e, i, a, _)=>xhr.setRequestHeader(a[_=2*i], a[_+1])),
  xhr.send(payload)
}, minify=_=>_.replace(/\n+|\t+/g, '').replace(/\s*\{\s*/g, '{').replace(/\s*\}\s*/g, '}').replace(/\s*:\s*/g, ':').replace(/\s*;\s*/g, ';').replace(/\s*,\s*/g, ',');

function crE(_,o){
  _=d.createElement(_),
  o&&extend(_)(o);
  return _;
}
function qs(_) {
  d.querySelector(_)
}
function extend(a) {
  return function(b, cb) {
    for(let i in b) a[i]=b[i], cb&&cb.call&&cb(i);
  }
}
function storage(obj, props, key, value, fn, fx, res, arg) {
	Is(obj, 'Object')&&
	(props={}, [!0, !!0, 'prop', 'value', 'key'].forEach(e=>{
		obj[e]&&(props[e]=obj[e])
	}),
	tryCatch(function(fn){
		res = localStorage[props.prop+'Item'](props.key, arg=props.value),
		(fn=props.true)&&fn(res, arg)
	}, props.false))
  return res
}

function tryCatch(fn,fx) {
  try {
    fn&&fn()
  } catch (e) {
    fx&&fx(e)
  }
}
function Is(entity, type) {
  let a = entity==void 0?_toString(entity).replace(/\[object |\]/g ,''):entity.constructor.name
  return (type?(type === a || a.toUpperCase()===type.toUpperCase()):a)
}

//fetch other scripts
script = document.createElement('script');
let src;
switch(ID('utils').getAttribute('data-which')) {
  case 'admin':
    src = 'assets/admin/js/winLoss_fn.js'
  break;

  case 'user':
    src = 'core/API/core.js'
  break;
}
[{name:'src', value:domain+'/'+src}].forEach(e=>script.setAttribute(e.name, e.value)), document.head.appendChild(script);



