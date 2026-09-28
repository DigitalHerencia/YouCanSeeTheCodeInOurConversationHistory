module.exports=async(params)=>{const base=params.app.vault.adapter.getBasePath();const tp=params.tp;return require(base+'/2.AREAS/SYSTEM/Scripts/templater/codelab.js')(tp);};
