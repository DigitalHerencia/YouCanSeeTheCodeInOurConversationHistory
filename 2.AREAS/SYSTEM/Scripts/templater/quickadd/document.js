module.exports=async p=>{const root=p.app.vault.adapter.getBasePath();return require(root+'/2.AREAS/SYSTEM/Scripts/templater/document.js')(p.tp,'Document')};
