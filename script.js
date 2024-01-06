var systemUrl = 'https://tcc.zouli.work/';
var apiUrl = 'https://tcc.zouli.work/api/';
if(typeof csrf == "undefined"){
  var csrf ='';
}
var patientId =0;

var $_GET=[];
window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,function(a,name,value){$_GET[name]=value;});
var cacheCamposCId ={};



window.addEventListener('online', function () {
  if(document.getElementById('offlineWarning')){
    document.getElementById('offlineWarning').style.display ='none';
  }
});
window.addEventListener('offline', function (){
  if(document.getElementById('offlineWarning')){
    document.getElementById('offlineWarning').style.display ='';
  }
});
if(!window.navigator.onLine){
  setTimeout(async function (){
    await  locksLoad;
    if(document.getElementById('offlineWarning')){
      document.getElementById('offlineWarning').style.display ='';
    }
  },1);
}


if (location.protocol !== 'https:') {

  alert('RODE ESSE SISTEMA EM HTTPS, Está tudo hardcodado para só aceitar https');
  alert('Estou falando serio, não envie informações sensiveis via http');

}
var promiseResolveLoad;
var locksLoad= new Promise(function (resolve, reject) {
  promiseResolveLoad = resolve;
});

document.addEventListener("DOMContentLoaded", async function(){
  promiseResolveLoad();
});
function checkLogged(){
  $.ajax({
    type: 'POST',
    url: apiUrl + 'users/me.php',
    success: async function (data) {
      if(data['success'] !== true || typeof data['success']  == "undefined"){
        forceRedirect('index.html');
      }else{
        await locksLoad;
        if(typeof data['data']['csrf'] != "undefined"){
          csrf = data['data']['csrf'];
        }
        document.querySelectorAll('.hiddenUntilLogin').forEach(function (e){
          e.classList.remove('hiddenUntilLogin');
        })

      }
    },
    error: function (){
      forceRedirect('index.html');
    }
  });
}
if(typeof checkLogin != "undefined"){
  setTimeout(function (){
    checkLogged();
  },1);
}

function login(){
  if(!document.getElementById('loginForm').reportValidity()){
    return;
  }
  let bt =document.getElementById('loginbt');


  bt.disabled =true;
  let i = bt.innerHTML;
  bt.innerHTML = 'Entrando..';
  $.ajax({
  	type: 'POST',
  	data: {'email': document.getElementById('inputEmail').value,'password':document.getElementById('inputSenha').value},
  	url: apiUrl + 'users/login.php',
  	success: async function (data) {
      bt.innerHTML =i; bt.disabled =false;
      if(data['success'] !== true || typeof data['success']  == "undefined"){ error(data['msg'] ? data['msg'] : "Erro ao enviar os dados"); return;}
      forceRedirect('home.html');
  	},
  	error: function (){
      bt.innerHTML =i; bt.disabled =false;
  		error("Erro ao enviar os dados");
  	}
  });


}

function removeElement(e){
  e.parentNode.remove();
}
function forceRedirect(url){
  url = systemUrl + url;
  window.location.href = url;

}
var countDiagnosticos =0;
function addDiagnostico(id){
  countDiagnosticos++;
  let html = `<div class="row py-2">
                        <div style=""  class="col-md-6 pergunta esconder2">
                            <label for="diagnostico[${countDiagnosticos}]" class="form-label mt-1">Diagnóstico (CID10)<span>*</span></label>
                            <input type="text" maxlength="64" minlength="1" class="form-control" id="diagnostico_[${countDiagnosticos}]" name="diagnostico[${countDiagnosticos}]"  placeholder="" required>
                        </div>
                        <div style=""  class="col-md-4 pergunta esconder2">
                            <label for="Idade_diagnostico[${countDiagnosticos}]" class="form-label mt-1">Idade diagnosticado<span>*</span></label>
                            <input type="text" maxlength="64" minlength="1" class="form-control" id="Idade_diagnostico[${countDiagnosticos}]" name="Idade_diagnostico[${countDiagnosticos}]"  placeholder="" required>
                        </div>
                        <div style=""  class="col-md-2 esconder2 align-self-end mt-3">
                            <button class="buttonAdd" style="background-color: red" onClick="this.parentNode.parentNode.remove(this)"><i class="fa-solid fa-minus"></i></button>
                        </div>
                    </div>
                `;
  document.getElementById(id).insertAdjacentHTML('beforeend',html);
}
var countSuicidios =0;
function addSuicidio(id){
  countSuicidios++;
  let html = `<div class="row py-2">
                        <div style=""  class="col-md-6 pergunta esconder4">
                            <label for="suicidiometodo[${countSuicidios}]" class="form-label mt-1">Método da tentativa<span>*</span></label>
                            <input type="text" maxlength="64" minlength="1" class="form-control" id="suicidiometodo[${countSuicidios}]" name="suicidiometodo[${countSuicidios}]"  placeholder="" required>
                        </div>
                        <div style=""  class="col-md-4 pergunta esconder2">
                            <label for="idadeTentativa[${countSuicidios}]" class="form-label mt-1">Idade<span>*</span></label>
                            <input type="text" maxlength="64" minlength="1" class="form-control" id="idadeTentativa[${countSuicidios}]" name="idadeTentativa[${countSuicidios}]"  placeholder="" required>
                        </div>
                        <div style=""  class="col-md-2 esconder2 align-self-end mt-3">
                            <button class="buttonAdd" style="background-color: red" onClick="this.parentNode.parentNode.remove(this)"><i class="fa-solid fa-minus"></i></button>
                        </div>
                    </div>
                `;
  document.getElementById(id).insertAdjacentHTML('beforeend',html);
}
var countFarmacoenxuto =0;
function addFarmacoenxuto(id){
  countFarmacoenxuto++;
  let html = `<div class="row py-2">
                        <div style=""  class="col-md-4 pergunta ">
                            <label for="nomeFarmacoEnxuto[${countFarmacoenxuto}]" class="form-label mt-1">Fármaco <span>*</span></label>
                            <input type="text" maxlength="64" minlength="1" class="form-control" id="nomeFarmacoEnxuto[${countFarmacoenxuto}]" name="nomeFarmacoEnxuto[${countFarmacoenxuto}]"  placeholder="" required>
                        </div>
                        <div style=""  class="col-md-4 pergunta ">
                            <label for="intervaloFarmacoEnxuto[${countFarmacoenxuto}]" class="form-label mt-1">Intervalo de dose <span>*</span></label>
                            <input type="text" maxlength="64" minlength="1" class="form-control" id="intervaloFarmacoEnxuto[${countFarmacoenxuto}]" name="intervaloFarmacoEnxuto[${countFarmacoenxuto}]"  placeholder="" required>
                        </div>
                        <div style=""  class="col-md-3 pergunta ">
                            <label for="respostaFarmacoEnxuto[${countFarmacoenxuto}]" class="form-label mt-1">Resposta <span>*</span></label>
                            <input type="hidden" value="Nula"  id="respostaFarmacoEnxuto[${countFarmacoenxuto}]" name="respostaFarmacoEnxuto[${countFarmacoenxuto}]" >
                            <select class="form-select select-form" id="respostaFarmacoEnxutoS[${countFarmacoenxuto}]" name="respostaFarmacoEnxutoS[${countFarmacoenxuto}]" onchange="document.getElementById('respostaFarmacoEnxuto[${countFarmacoenxuto}]').value = this.value">
                                <option value="Nula">Nula</option>
                                <option value="Parcial">Parcial</option>
                                <option value="Total">Total</option>
                            </select>
                        </div>
                        <div style=""  class="col-md-1 esconder2 align-self-end mt-3">
                            <button class="buttonAdd" style="background-color: red" onClick="this.parentNode.parentNode.remove(this)"><i class="fa-solid fa-minus"></i></button>
                        </div>
                    </div>
                `;
  document.getElementById(id).insertAdjacentHTML('beforeend',html);
}

var countCirurgia = 0;
function addCirurgia(id){
  countCirurgia++;
  let html= `<div class="row py-2">
                        <div style=""  class="col-md-8 pergunta esconder1">
                            <label for="cirurgia[${countCirurgia}]" class="form-label mt-1">Cirurgia realizada<span>*</span></label>
                            <input type="text" maxlength="64" minlength="1" class="form-control" id="cirurgia[${countCirurgia}]" name="cirurgia[${countCirurgia}]"  placeholder="" required>
                        </div>
                        <div style=""  class="col-md-4 esconder2 align-self-end mt-3">
                            <button class="buttonAdd" style="background-color: red" onClick="this.parentNode.parentNode.remove(this)"><i class="fa-solid fa-minus"></i></button>
                        </div>
                    </div>`;
  document.getElementById(id).insertAdjacentHTML('beforeend',html);

}

function sortFields(a, b) {
  if (a['row'] < b['row']) return -1;
  if (a['row'] > b['row']) return 1;
  if (a['col'] < b['col']) return -1;
  if (a['col'] > b['col']) return 1;
  return 0;
}


// [{"type":"text","row":"1","col":"0","cfg":{"label":"Nome do Paciente","placeholder":"João Silva","minLength":"2","maxLength":"64","classes":""}},{"type":"text","row":"2","col":"0","cfg":{"label":"Registro Interno ","placeholder":"HC001","minLength":"1","maxLength":"32","classes":"registroInternoHC"}}]
function buildPage(data,page= "nomeDaPagina"){

  let c,html,j,fieldName;

  data = data.sort(sortFields);
  let currentRow=0;
  html = `<div class="" id="${page}"></div>`;
  document.getElementById('corpo').insertAdjacentHTML('beforeend',html);
  let pagina = document.getElementById(page);
  for(let i=0; i < data.length; i++){
    c = data[i];
    if(currentRow !== c['row']){
      currentRow = c['row'];
      html = `<div class="mb-4 row " id="row_${c['row']}_${page}"></div>`;
      pagina.insertAdjacentHTML('beforeend',html);
    }

    html = fieldToHTML(c);
    document.getElementById('row_'+c['row']+'_' + page).insertAdjacentHTML('beforeend',html);
    let fieldName = c.cfg['fieldName'] ? c.cfg["fieldName"]:cleanFieldName(c.cfg['label']);

    switch (c['type']){
      case('radio'):
      case('checkbox'):{
        fieldName =  fieldName +'_0';
        break;
      }
    }
    if(typeof c.cfg.unlocker != "undefined"){updateUnlocker(document.getElementById(fieldName));}
    if(typeof c.cfg.unlockerPagina != "undefined"){unlockerPagina(document.getElementById(fieldName));}





  }




}

function cleanFieldName(string){
  string = string.trim().replaceAll(' ','_').toLowerCase();
  string = string.replaceAll('?','');
  string = string.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
  return string;
}
var cacheCampos ={}
function fieldToHTML(c){
  let k,html,cfg,style;
  cfg = c['cfg'];

  if(typeof cfg['classesd'] == 'undefined'){
    cfg['classesd'] = '';
  }
  if(cfg['classesd'].length){
    style ='display:none';
  }else{
    style ='';
  }
  if(typeof cfg['span'] == "undefined"){
    cfg['span'] ="";
  }


  /*
  PLACEHOLDER POIS NAO CONFERI NOMES DUPLICADOS:
   */
  let fieldName = cfg['fieldName'] ? cfg["fieldName"]:cleanFieldName(cfg['label']); //UNIQUE
  cacheCampos[fieldName] =c;
  cacheCamposCId[c['cId']] =fieldName;
  switch (c['type']){
    case('title'):{
      html = `<div style="${style}" class="col-${c['colsize']} text-center">
                    <h2 class="${cfg['classes']}">${cfg['label']}</h2>
                </div>`;

      return html;
    }
    case('shortText'):{
      html = `<div style="${style}"  class="col-${c['colsize']} ${cfg['classesd']}" id="${fieldName}">
                    <p class="${cfg['classes']}">${cfg['label']}</p>
                </div>`;

      return html;
    }
    case('subtitle'):{
      html = `<div style="${style}"  class="col-${c['colsize']} ${cfg['classesd']}">
                    <h4 class="${cfg['classes']} mt-3">${cfg['label']}</h4>
                </div>`;

      return html;
    }
    case('text'):{
      let min ='';
      let max ='';
      if(cfg['minLength'].length > 0){min =`minlength=${cfg['minLength']}`;}
      if(cfg['maxLength'].length > 0){max =`maxlength=${cfg['maxLength']}`;}


      html = `<div style="${style}"  class="col-md-${c['colsize']} ${cfg['classesd']}">
                    <label for="${fieldName}" class="form-label mt-1">${cfg['label']}<span>${cfg['span']}</span></label>
                    <input type="text" ${max} ${min} class="form-control ${cfg['classes']}" id="${fieldName}" name="${fieldName}"  placeholder="${cfg['placeholder']}" required>
                </div>`;

      return html;
    }
    case('radio'):{
      html = `<div style="${style}"  class="col-${c['colsize']} ${cfg['classesd']}">
                <p>${cfg['label']}<span>${cfg['span']}</span></p>`;

      let options = cfg['options'].split(",");
      for(let i=0; i< options.length; i++){
        html +=     `<div  class="d-flex align-content-center   mt-1">
                        <input ${cfg['unlocker'] ? 'onchange="updateUnlocker(this)"' :""} class="form-check ${cfg['classes']}" type="radio" name="${fieldName}" id="${fieldName}_${i}" value="${options[i]}" required>
                        <label for="${fieldName}_${i}" class="form-label ms-3 mb-1">${options[i]}</label>
                    </div>`
      }



      html += ` </div>`;
      return html;
    }
    case('number'):{
      let min ='';
      let max ='';
      if(cfg['minLength'].length > 0){min =`minlength=${cfg['minLength']}`;}
      if(cfg['maxLength'].length > 0){max =`maxlength=${cfg['maxLength']}`;}

      html = `<div style="${style}"  class="col-md-${c['colsize']} ${cfg['classesd']}">
                    <label for="${fieldName}" class="form-label mt-1">${cfg['label']}<span>${cfg['span']}</span></label>
                    <input type="number" ${max} ${min} class="form-control ${cfg['classes']}" id="${fieldName}" name="${fieldName}" required>
                </div>`;

      return html;
    }
    case('date'):{
      html = `<div style="${style}"  class="col-md-${c['colsize']} ${cfg['classesd']}">
                    <label for="${fieldName}" class="form-label mt-1">${cfg['label']}<span>${cfg['span']}</span></label>
                    <input type="date" class="form-control ${cfg['classes']}" id="${fieldName}" name="${fieldName}" required>
                </div>`;

      return html;
    }
    case('checkbox'):{

      html = `<div style="${style}"  class="col-${c['colsize']} ${cfg['classesd']}">
                <p>${cfg['label']}<span>${cfg['span']}</span></p>`;

      let options = cfg['options'].split(",");
      for(let i=0; i< options.length; i++){
        html +=     `<div  class="d-flex align-content-center mt-1">
                        <input ${cfg['unlocker'] ? 'onchange="updateUnlocker(this)"' :""} ${cfg['unlockerPagina'] ? 'onchange="unlockerPagina(this)"' :""} class="form-check ${cfg['classes']}" type="checkbox" name="${fieldName}" id="${fieldName}_${i}" value="${options[i]}">
                        <label for="${fieldName}_${i}" class="form-label ms-2 mb-1">${options[i]}</label>
                    </div>`
      }
      html += ` </div>`;
      return html;



    }
    case('select'):{
      html = `<div style="${style}"  class="col-md-${c['colsize']} ${cfg['classesd']}">
                <label class="form-label mt-1">${cfg['label']}<span>${cfg['span']}</span></label>`;

      let options = cfg['options'].split(",");
      html+= `<select ${cfg['unlocker'] ? 'onchange="updateUnlocker(this)"' :""} class="form-select select-form" name="${fieldName}" id="${fieldName}" required>`;
      for(let i=0; i< options.length; i++){
        html +=     `<option value="${options[i]}">${options[i]}</option>`
      }
      html+=`</select>`;
      html += ` </div>`;
      return html;

    }
    case('diagnostico'):{

        let min ='';
        let max ='';
        if(cfg['minLength'].length > 0){min =`minlength=${cfg['minLength']}`;}
        if(cfg['maxLength'].length > 0){max =`maxlength=${cfg['maxLength']}`;}

        html=`<div class="diagnosticos" id="${fieldName}">
                    
                </div>
                <div style="${style}"  class="col-md-2 ${cfg['classesd']} align-self-end mt-2">
                    <button type="button" class="buttonAdd ${cfg['classes']}" id="${fieldName}" name="${fieldName}" onclick="addDiagnostico('${fieldName}')"><i class="fa-solid fa-plus"></i></button>
                </div>
                `
          return html;
    }
    case('suicidio'):{

      let min ='';
      let max ='';
      if(cfg['minLength'].length > 0){min =`minlength=${cfg['minLength']}`;}
      if(cfg['maxLength'].length > 0){max =`maxlength=${cfg['maxLength']}`;}

      html=`<div class="suicidios" id="${fieldName}">
                    
                </div>
                <div style="${style}"  class="col-md-2 ${cfg['classesd']} align-self-end mt-2">
                    <button type="button" class="buttonAdd ${cfg['classes']}" id="${fieldName}" name="${fieldName}" onclick="addSuicidio('${fieldName}')"><i class="fa-solid fa-plus"></i></button>
                </div>
                `
      return html;
    }
    case('farmacoenxuto'):{

      let min ='';
      let max ='';
      html=`<div class="farmacoenxuto" id="${fieldName}">
                    
                </div>
                <div style="${style}"  class="col-md-2 ${cfg['classesd']} align-self-end mt-2">
                    <button type="button" style="font-size: 12px" class="btn btn-info ${cfg['classes']}" id="${fieldName}" name="${fieldName}" onclick="addFarmacoenxuto('${fieldName}')">Novo Fármaco</button>
                </div>
                `
      return html;
    }
    case('cirurgia'):{

      let min ='';
      let max ='';
      if(cfg['minLength'].length > 0){min =`minlength=${cfg['minLength']}`;}
      if(cfg['maxLength'].length > 0){max =`maxlength=${cfg['maxLength']}`;}

      html=`<div class="cirurgias" id="${fieldName}">
                    
             </div>
                <div style="${style}"  class="col-md-2 ${cfg['classesd']} align-self-end mt-2">
                    <button type="button" class="buttonAdd ${cfg['classes']}" id="${fieldName}" name="${fieldName}" onclick="addCirurgia('${fieldName}')"><i class="fa-solid fa-plus"></i></button>
                </div>
                `
      return html;
    }

  }
}
function error(title,msg=''){
  alert(title + ' '+msg);
}

var formId =0;
var paginas = [ ];
var downloaded ={};
var paginalAtual = 0;
var paginasBloqueadas = {};
async function carregaPaginas(){
  if(typeof $_GET['f'] == "undefined"){
    if(typeof $_GET['formId'] =="undefined"){
      forceRedirect('home.html');
      return;
    }else{
      formId = parseInt($_GET['formId']);
    }
  }else{
    formId = parseInt($_GET['f']);
  }

  await $.ajax({
  	type: 'GET',
    data: {'formId':formId},
  	url: apiUrl + '/forms/listPages.php',
  	success: async function (data) {
  		if(data['success'] !== true || typeof data['success']  == "undefined"){ error(data['msg'] ? data['msg'] : "Erro ao carregar os dados"); return;}
          paginas = data['data'];
        document.getElementById('formName').innerHTML =`<a href="home.html" class="me-1"><i class="fa-solid fa-backward"></i></a> ${data['meta']['name']}`;
        document.title = data['meta']['name'];
        if(typeof $_GET['pacienteId'] != "undefined"){
          patientId = parseInt($_GET['pacienteId']);
        }
    },
  	error: function (){
  		error("Erro ao carrear os dados");
  	}
  });
  if(paginas.length < 1){
    error('Form não encontrado');return;
  }



  let aBaixar = [];
  for(let i=0; i<paginas.length; i++){
    aBaixar.push(downloadFile(paginas[i]));
  }
  await Promise.all(aBaixar);
  for(let i=0; i<paginas.length; i++){
    buildPage(downloaded[paginas[i]],paginas[i]);
  }
  esconderPagina();
  if(patientId !== 0){
    populateFromPatientId(patientId,formId);
  }
  document.getElementById(paginas[paginalAtual]).style.display="";

}
function populateFromPatientId(patientId,formId){
  let pFId =0;
  if(typeof $_GET['pFId'] != "undefined"){
    pFId = parseInt($_GET['pFId']);
  }
  $.ajax({
  	type: 'POST',
  	data: {'csrf': csrf,'pacienteId':patientId,'pFId':pFId,'formId':formId},
  	url: apiUrl + 'forms/getBody.php',
  	success: async function (data) {
  		if(data['success'] !== true || typeof data['success']  == "undefined"){  return;}
        let c,d,fieldName;
          for(let i in data['data']){
            if(typeof cacheCamposCId[i] == "undefined" || typeof cacheCampos[cacheCamposCId[i]] == "undefined"){
              continue;
            }
            d = cacheCampos[cacheCamposCId[i]];
            fieldName = d.cfg['fieldName'] ? d.cfg["fieldName"]:cleanFieldName(d.cfg['label']); //UNIQUE
            c = data['data'][i];
            switch (d['type']){
              case('number'):
              case('select'):
              case('text'):
              case('date'):{
                if(document.getElementById(fieldName)) {
                  document.getElementById(fieldName).value = c;
                }
                break;
              }
              case('radio'): {

                document.querySelectorAll(`input[name=${fieldName}][value="${sanitize(c)}"]`).forEach(function (e){
                  // e.checked = true;
                  $('#'+e.id).trigger('click');
                });
                break;
              }
              case('checkbox'):{
                c = c.split(', ');
                for(let k in c){
                  document.querySelectorAll(`input[name=${fieldName}][value="${sanitize(c[k])}"]`).forEach(function (e){
                    // e.checked = true;
                    $('#'+e.id).trigger('click');
                  });
                }
                break;
              }

            }

          }
  	}
  });
}


function esconderPagina(){
  for(let i=0; i<paginas.length; i++){
    document.getElementById(paginas[i]).style.display="none";
  }


}

function downloadFile(name){
  return $.ajax({
    type: 'GET',
    url: "paginas/" +name,
    success: async function (data) {
      downloaded[name]=data;
    }
  });
}

function isHidden(el){
  return !!!el.offsetParent;
}

function avancar(){




  if(checkForm()
      // || true
  ){
    paginalAtual++;
    if(typeof paginasBloqueadas[paginas[paginalAtual]] != "undefined" && paginasBloqueadas[paginas[paginalAtual]] == 1 ){
      avancar();return;
    }


    if(paginalAtual >= paginas.length){
      esconderPagina();
      document.getElementById("btnVoltar").disabled = false;
      document.getElementById('btnAvancar').style.display='none';
      document.getElementById('resumoEnviar').style.display='';
      genRespostas();
      return;
    }


    esconderPagina();
    document.getElementById(paginas[paginalAtual]).style.display="";
    document.getElementById("btnVoltar").disabled = false;
  }
  else{
    alert("Preencha todos os campos");
  }

}

function voltar(){

  paginalAtual--;

  if(paginalAtual < paginas.length){

    document.getElementById('btnAvancar').style.display='';
    document.getElementById('resumoEnviar').style.display='none';
    // return;
  }

    if(paginalAtual === 0){
      document.getElementById("btnVoltar").disabled = true;
    }
  if(typeof paginasBloqueadas[paginas[paginalAtual]] != "undefined" && paginasBloqueadas[paginas[paginalAtual]] == 1 ){
    voltar();return;
  }
    document.getElementById("btnAvancar").disabled = false;
    esconderPagina();
    document.getElementById(paginas[paginalAtual]).style.display="";

}

function checkForm(){
  let form = document.getElementById(paginas[paginalAtual]).getElementsByClassName("inputCriado");
  for(let i=0; i<form.length; i++){
    if(form[i].type =='checkbox'){
      if(document.querySelectorAll(`input[name="${form[i].name}"]:checked`).length){
        continue;
      }else{
        if(isHidden(form[i])){
          continue;
        }
        return false;
      }
    }


    if(!form[i].checkValidity()){
      if(isHidden(form[i])){
        continue;
      }
      return false;
    }
  }
  return true;
}

function updateUnlocker(input){
  let valor = input.value;
  let valores =[];
  let d,c,classes;
  let elements;
  /*
  NÃO ESQUECER DE LIMPAR OS CAMPOS
   */
  c = cacheCampos[input.name];
  if(typeof c.cfg.unlocker == "undefined"){
    return ;
  }

  if(input.type === "checkbox" || input.type === "radio"){
    valor = document.querySelectorAll('input[name="'+input.name+'"]:checked');
      for(let i =0; i< valor.length; i++){
        valores.push(valor[i].value);
      }



    for(let opcao in c.cfg.unlocker){

       if(valores.includes(opcao)) {
         d = '';
       }else{
         d='none';
       }
       classes =c.cfg.unlocker[opcao];
       for(let i in classes){
          document.querySelectorAll("."+classes[i]).forEach(function (e){
            e.style.display=d;
          })
       }


    }
    return;
  }

  for(let opcao in c.cfg.unlocker){

    if(valor == opcao) {
      d = '';
    }else{
      d='none';
    }
    classes =c.cfg.unlocker[opcao];
    for(let i in classes){
      document.querySelectorAll("."+classes[i]).forEach(function (e){
        e.style.display=d;
      })
    }


  }

}


function unlockerPagina(input) {
  let valor = input.value;
  let valores = [];
  let d, c, classes;
  let elements;

  valor = document.querySelectorAll('input[name="' + input.name + '"]:checked');
  for (let i = 0; i < valor.length; i++) {
    valores.push(valor[i].value);
  }

  c = cacheCampos[input.name];
  let status =0;
  for (let opcao in c.cfg.unlockerPagina) {
    // debugger;

    if (valores.includes(opcao)) {
      status =0;
    } else {
      status = 1;
    }
    for(let k in c.cfg.unlockerPagina[opcao]){
      paginasBloqueadas[c.cfg.unlockerPagina[opcao][k]] =status;
    }


  }
}

var inputs = []
function genRespostas(){
  let c,value,label,fieldName;
  let respostas = [];
  for(let i in cacheCampos){
    c = cacheCampos[i];
    label = c.cfg.label;
    fieldName = c.cfg['fieldName'] ? c.cfg["fieldName"]:cleanFieldName(c.cfg['label']); //UNIQUE
    value ='';
    switch (c['type']){
      case('radio'):
      case('checkbox'):{
        value =[];
        document.querySelectorAll('input[name="'+fieldName+'"]:checked').forEach(function (e){
          value.push(e.value);
        });
        value = value.join(', ');
        break;
      }
      case('farmacoenxuto'):
      case('diagnostico'):
      case('suicidio'):
      case('cirurgia'):{
       let main = document.getElementById(fieldName);
        let rows = main.getElementsByClassName('row');
        value =[];
      let els,cur,c;
        for(let k =0; k < rows.length; k++){
            els = rows[k].getElementsByClassName('pergunta');
            cur =[];
            for(let uu =0; uu< els.length; uu++){
                c = els[uu];
                cur.push({"label": c.getElementsByTagName('label')[0].innerText.replaceAll('*',''),'value':c.getElementsByTagName('input')[0].value.replaceAll(':','')});
            }
            value.push(cur);

        }
        // debugger;
        let realValue="";
        for(let k in value){
          c = value[k];
          for(let uu in c){
            realValue += c[uu]['label'] + ':: '+c[uu]['value']+' / ';
          }
          if(realValue.endsWith(" / ")){
            realValue = realValue.slice(0, -3);
          }

          realValue += " \n";
        }

        value =realValue.trim();
        if(value.length >3){
          value = " \n"+value;
        }

        break;
      }

      case('date'):
      case('number'):
      case('select'):
      case('text'):{

        value = document.getElementById(fieldName).value;
        break;
      }
      default:{
        value ='';
        break;
      }

    }
    if(value.length > 0){
      respostas.push({'fieldName':fieldName,'label':label,'value':value,'cId':c['cId']});
    }

  }
  document.getElementById('reviewAll').innerHTML='';
  let html;
 for(let i in respostas){
    c = respostas[i];
    html = `${c['label']}: ${c['value']}<br>`;
    document.getElementById('reviewAll').insertAdjacentHTML('beforeend',html);
 }
  return respostas;

}

function sendForm(){
  if(typeof patientId == "undefined" ){
    let patientId = 0;
  }

  let bt = document.getElementById('sendFormBt');
  let inner = bt.innerHTML;
  bt.disabled = true;
  bt.innerHTML ='Enviando ...';
  //we can save bytes if we change fieldLabel to cId;

  let res ={};
  genRespostas().map(function (e){
    res[e['cId']] = e['value'];
    return false;
  });


    $.ajax({
      type: 'POST',
      data: {'csrf': csrf,'patientId':patientId,'formId':formId,'data':JSON.stringify(res)},
      url: apiUrl + 'forms/send.php',
      success: async function (data) {
        bt.disabled = false;
        bt.innerHTML =inner;
          if(data['success'] !== true || typeof data['success']  == "undefined"){ error(data['msg'] ? data['msg'] : "Erro ao enviar os dados"); return;}
          forceRedirect('pacientes.html');
      },
      error: function (){
        bt.disabled = false;
        bt.innerHTML =inner;
          error("Erro ao enviar os dados");
      }
    });

}
function getAge(dateString) {
  var today = new Date();
  var birthDate = new Date(dateString);
  var age = today.getFullYear() - birthDate.getFullYear();
  var m = today.getMonth() - birthDate.getMonth();
  if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
    age--;
  }
  return age;
}
function sanitize(string) {
  if(typeof string == "undefined"){
    return "";
  }
  if(typeof string =="number"){return string;}
  if(typeof string =="object"){
    let tO = {};
    let k;
    for(k in string){
      tO[k] = sanitize(string[k]);
    }
    return tO;
  }
  if(typeof string.replace != 'function'){
    return string;
  }
  string = string.replace(/<[^>]*>?/gm, '');
  const map = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#x27;',
    "/": '&#x2F;',
  };
  const reg = /[&<>"'/]/ig;
  return string.replace(reg, (match)=>(map[match]));
}
function desanitize(string) {
  if(typeof string == "undefined"){
    return "";
  }
  if(typeof string =="number"){return string;}
  if(typeof string =="object"){
    let tO = {};
    let k;
    for(k in string){
      tO[k] = desanitize(string[k]);
    }
    return tO;
  }
  var txt = document.createElement("textarea");
  txt.innerHTML = string;
  return txt.value;
}