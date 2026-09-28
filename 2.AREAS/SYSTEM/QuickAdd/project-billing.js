module.exports=async p=>require('./project-create-core')({...p,variables:{...(p.variables||{}),ontology:'BILLING'}});
