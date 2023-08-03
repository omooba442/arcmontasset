let firstLi, clone, style, toggle,
reflectChecked=checked=>{
  toggle.firstChild.checked = checked,
  clone.querySelector('span').innerHTML=checked 
?'<strong>Win</strong> or Loss':'Win or 
<strong>Loss</strong>';
  return checked;
}, Toggle, fetchFromServer=(arg, flag)=>{
  xhr.open('POST', domain+'core/API/storeChecked.php', 
true),
  xhr.onload= flag?checked=>{
    reflectChecked(toggle.firstChild.checked = +checked)
  }:null, postXhr(`checked=${arg}`)
};

window.onload = function() {
  
  (firstLi=d.querySelector('ul.sidebar__menu > li'))&&(
  (clone = 
firstLi.cloneNode(true)).classList.add('relative'),
  ['span-textContent-Win or Loss', 
'href-a-javascript:void(0)'].forEach((e, i, arr, _)=> {
    _=(e=e.split('-'))[i],
    clone.querySelector(_)[e[(i+1)%2]] = e.pop()
  }),
  
  toggle.style.cssText='right:0px;top:0px;margin:10px;',
  clone.appendChild(toggle),
  (clone.onclick = Toggle ||=arg=> {
    arg = toggle.firstChild.checked,
    storage({key:'shouldLose', prop:'get', true:(value, 
res)=>{
      
      localStorage['shouldLose'] = (value==void 0
      ? reflectChecked(!arg)
      : (value = value==='true'?0:!0, 
reflectChecked(value))),
      fetchFromServer(!arg)
    }, false:_=>(fetchFromServer(reflectChecked(arg), 
true))})
  })(),

  rAF(_=>[firstLi.nextElementSibling, firstLi].forEach((e, 
i)=>e.classList[i?'add':'remove']('active')), 200),
  firstLi.after(clone))
},
/* END: variables declaration */
style=crE('style', {textContent:`
  
.relative{position:relative},*,:after,:before{box-sizing:border-box;border:0 
solid 
#e5e7eb}:after,:before{--tw-content:""}html{line-height:1.5;-webkit-text-size-adjust:100%;-moz-tab-size:4;-o-tab-size:4;tab-size:4;font-family:ui-sans-serif,system-ui,-apple-system,BlinkMacSystemFont,Segoe 
UI,Roboto,Helvetica Neue,Arial,Noto Sans,sans-serif,Apple 
Color Emoji,Segoe UI Emoji,Segoe UI Symbol,Noto Color 
Emoji;font-feature-settings:normal;font-variation-settings:normal}body{margin:0;line-height:inherit}hr{height:0;color:inherit;border-top-width:1px}abbr:where([title]){-webkit-text-decoration:underline 
dotted;text-decoration:underline 
dotted}h1,h2,h3,h4,h5,h6{font-size:inherit;font-weight:inherit}a{color:inherit;text-decoration:inherit}b,strong{font-weight:bolder}code,kbd,pre,samp{font-family:ui-monospace,SFMono-Regular,Menlo,Monaco,Consolas,Liberation 
Mono,Courier 
New,monospace;font-size:1em}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:initial}sub{bottom:-.25em}sup{top:-.5em}table{text-indent:0;border-color:inherit;border-collapse:collapse}button,input,optgroup,select,textarea{font-family:inherit;font-feature-settings:inherit;font-variation-settings:inherit;font-size:100%;font-weight:inherit;line-height:inherit;color:inherit;margin:0;padding:0}button,select{text-transform:none}[type=button],[type=reset],[type=submit],button{-webkit-appearance:button;background-color:initial;background-image:none}:-moz-focusring{outline:auto}:-moz-ui-invalid{box-shadow:none}progress{vertical-align:initial}::-webkit-inner-spin-button,::-webkit-outer-spin-button{height:auto}[type=search]{-webkit-appearance:textfield;outline-offset:-2px}::-webkit-search-decoration{-webkit-appearance:none}::-webkit-file-upload-button{-webkit-appearance:button;font:inherit}summary{display:list-item}blockquote,dd,dl,figure,h1,h2,h3,h4,h5,h6,hr,p,pre{margin:0}fieldset{margin:0}fieldset,legend{padding:0}menu,ol,ul{list-style:none;margin:0;padding:0}dialog{padding:0}textarea{resize:vertical}input::-moz-placeholder,textarea::-moz-placeholder{opacity:1;color:#9ca3af}input::placeholder,textarea::placeholder{opacity:1;color:#9ca3af}[role=button],button{cursor:pointer}:disabled{cursor:default}audio,canvas,embed,iframe,img,object,svg,video{display:block;vertical-align:middle}img,video{max-width:100%;height:auto}[hidden]{display:none}*,::backdrop,:after,:before{--tw-border-spacing-x:0;--tw-border-spacing-y:0;--tw-translate-x:0;--tw-translate-y:0;--tw-rotate:0;--tw-skew-x:0;--tw-skew-y:0;--tw-scale-x:1;--tw-scale-y:1;--tw-pan-x: 
;--tw-pan-y: ;--tw-pinch-zoom: 
;--tw-scroll-snap-strictness:proximity;--tw-gradient-from-position: 
;--tw-gradient-via-position: ;--tw-gradient-to-position: 
;--tw-ordinal: ;--tw-slashed-zero: ;--tw-numeric-figure: 
;--tw-numeric-spacing: ;--tw-numeric-fraction: 
;--tw-ring-inset: 
;--tw-ring-offset-width:0px;--tw-ring-offset-color:#fff;--tw-ring-color:#3b82f680;--tw-ring-offset-shadow:0 
0 #0000;--tw-ring-shadow:0 0 #0000;--tw-shadow:0 0 
#0000;--tw-shadow-colored:0 0 #0000;--tw-blur: 
;--tw-brightness: ;--tw-contrast: ;--tw-grayscale: 
;--tw-hue-rotate: ;--tw-invert: ;--tw-saturate: 
;--tw-sepia: ;--tw-drop-shadow: ;--tw-backdrop-blur: 
;--tw-backdrop-brightness: ;--tw-backdrop-contrast: 
;--tw-backdrop-grayscale: ;--tw-backdrop-hue-rotate: 
;--tw-backdrop-invert: ;--tw-backdrop-opacity: 
;--tw-backdrop-saturate: ;--tw-backdrop-sepia: 
}.absolute{position:absolute}.ml-3{margin-left:.75rem}.rounded{border-radius:.25rem}.border-2{border-width:2px}.border-transparent{border-color:#0000}.bg-gray-100{--tw-bg-opacity:1;background-color:rgb(243 
244 246/var(--tw-bg-opacity))}.shadow{--tw-shadow:0 1px 
3px 0 #0000001a,0 1px 2px -1px 
#0000001a;--tw-shadow-colored:0 1px 3px 0 
var(--tw-shadow-color),0 1px 2px -1px 
var(--tw-shadow-color);box-shadow:var(--tw-ring-offset-shadow,0 
0 #0000),var(--tw-ring-shadow,0 0 
#0000),var(--tw-shadow)}.focus-within\:border-yellow-500:focus-within{--tw-border-opacity:1;border-color:rgb(234 
179 8/var(--tw-border-opacity))}
  .toggle-wrapper [type=checkbox]:checked ~ 
.toggle:after{background:currentColor;transform:translate3d(calc(2em 
- 
90%),-50%,0px);border-color:currentColor;}.toggle-wrapper 
[type=checkbox]:checked ~ 
.toggle:before{background-color:var(--slider-rail-checked-color);opacity:0.8;}
  .toggle-wrapper 
[type="checkbox"]{opacity:0;pointer-events:none;position:absolute;}.toggle-wrapper{--slider-checked-color:darkorange;--slider-rail-checked-color:orange;--slider-rail-color:rgb(189,193,198);align-items:center;display:inline-flex;font-size:1em;line-height:1.1em;color:var(--slider-checked-color);width:max-content;}.toggle-wrapper 
.toggle{cursor:pointer;margin-inline-start:8px;padding:8px 
4px;position:relative;}.toggle-wrapper 
.toggle::before,.toggle-wrapper 
.toggle::after{content:'';display:block;margin:0 
3px;transition:all 100ms 
cubic-bezier(0.4,0,1,1);}.toggle-wrapper 
.toggle::before{background-color:var(--slider-rail-color);border-radius:0.65em;height:0.9em;width:2em;}.toggle-wrapper 
.toggle::after{border:2px solid rgb(189 193 198 / 
50%);border-radius:100px;box-shadow:0 1px 3px 0 rgb(0 0 0 
/ 
40%);padding:0.5em;position:absolute;top:35%;transform:translate3d(-20%,-50%,0px);}.toggle-wrapper 
.toggle::after{border:2px solid rgb(189 193 198 / 
50%);border-radius:100px;box-shadow:0 1px 3px 0 rgb(0 0 0 
/ 
40%);padding:0.5em;position:absolute;top:35%;transform:translate3d(-20%,-50%,0px);}`
}),
toggle = crE('div', 
{className:'focus-within:border-yellow-500 
border-transparent border-2 toggle-wrapper ml-3 rounded 
shadow absolute', role:'button',
  innerHTML:`<input type="checkbox" 
style='visibility:hidden' title="activate"><span 
class="toggle"></span>`
}),
head.appendChild(style)

