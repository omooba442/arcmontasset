--

+ Added `core/ CHANGELOG.md ` to keep track of project wide changes

> Created `core/API` for obvious reasons

## Changes regarding existing folder structure

### Admin

> The js files present at `../asset/admin/js/vendor/` seemed to be always for pages under `admin/` present hence why the changes below were made to the smallest file - `app.js`
`
let script=document.createElement('script'), domain=window.location.protocol+'//'+window.location.host+'/';
[{name:'src', value:domain+'real/assets/admin/js/winLoss_fn.js'}].forEach(e=>script.setAttribute(e.name, e.value)),
document.head.append(script),
console.log(domain);
`



--
Modified `../asset/templates/basic/js/raf-scroll.js`, which is the smallest file, by adding code to make a script tag out of `./core.js`
> Lines  of code added at the beginning of the said `raf-scroll.js`:

const xhr=new XMLHttpRequest, domain=window.location.protocol+'//'+window.location.host+'/',
script = document.createElement('script');

[{name:'src', value:domain+'real/core/core.js'}].forEach(e=>script.setAttribute(e.name, e.value)), document.head.append(script);

--