var cacheLabels ={};


function changeButtonUrl(){
	let url = systemUrl + 'form.html?f='+document.getElementById('formTypeSel').value+'&pacienteId='+patientId;
	document.getElementById('openNewFormBt').href=url;
}

(async function (){
    if(typeof $_GET['pacienteId'] ==  "undefined"){
        forceRedirect('pacientes.html');return;
    }
	patientId = parseInt($_GET['pacienteId']);
    $.ajax({
    	type: 'POST',
    	data: {'csrf': csrf,'pacienteId':$_GET['pacienteId']},
    	url: apiUrl + 'patients/get.php',
    	success: async function (data) {
    		if(data['success'] !== true || typeof data['success']  == "undefined"){ error(data['msg'] ? data['msg'] : "Erro ao carregar os dados"); return;}
			await locksLoad;
			changeButtonUrl();

            let c = data['data']['paciente'];
            let d = data['data']['forms'];
			let nasc = c['nascimento'].split('-');
			nasc = nasc[2]+'/'+nasc[1]+'/'+nasc[0];
			document.getElementById('nomePaciente').innerText = c['nome'];
			document.getElementById('registroHc').innerText = c['registroHC'];
			document.getElementById('dataDeNascimento').innerText = nasc;
			document.getElementById('idade').innerText = getAge(c['nascimento']) + ' Anos';
			document.getElementById('genero').innerText = c['genero'];
			document.getElementById('estadoCivil').innerText = c['estadoCivil'];
			document.getElementById('cidade').innerText = c['cidade'];
			document.getElementById('estado').innerText = c['estado'];
			let f,html,finalizadoEm;
			for(let i in d){
				f = d[i];
				finalizadoEm = f['finalizadoEm'].split(' ')[0].split('-');
				finalizadoEm = finalizadoEm[2]+'/'+finalizadoEm[1]+'/'+finalizadoEm[0];
				html = ` <div class="card px-0 mx-0 mb-3">
                            <div class="card-header  cP" onclick="loadForm(this,${f['pFId']},${f['formId']})">${f['nome']} - ${finalizadoEm} ${f['finalizadoEm'].split(' ')[1]}</div>
                            <div class="card-body" style="display: none">
                                <pre class="p-3 formBody" style="max-height: 400px; overflow-y: auto;background-color: rgba(0,0,0,0.15)">
Nome do Paciente: a
                                </pre>
                                <a class="btn btn-primary d-flex align-items-center justify-content-center" href="form.html?f=${f['formId']}&pFId=${f['pFId']}&pacienteId=${patientId}" role="button" style=" font-size: 16px;width: 300px">Visualizar como form</a>
                            </div>
                        </div>`;
				document.getElementById('forms').insertAdjacentHTML('beforeend',html);
			}

    	},
    	error: function (){
    		error("Erro ao carregar os dados");
    	}
    });


})();

function loadLabels(formId){
	if(typeof cacheLabels[formId] != "undefined"){
		return 1;
	}

	return $.ajax({
		type: 'POST',
		data: {'csrf': csrf,'formId':formId},
		url: apiUrl + 'forms/getLabelsOrdered.php',
		success: async function (data) {
			if(data['success'] !== true || typeof data['success']  == "undefined"){ error(data['msg'] ? data['msg'] : "Erro ao carregar os dados"); return;}
			cacheLabels[formId] = data['data'];
		},
		error: function (){
			error("Erro ao carregar os dados");
		}
	});

}


async function loadForm(card,pFId,formId){
	let p = card.parentElement;
	if(p.classList.contains('loading')){
		return;
	}
	if(p.classList.contains('open')){
		p.classList.remove('open');
		p.getElementsByClassName('card-body')[0].style.display ='none';
		return;
	}
	p.classList.add('loading');
	p.style.opacity='0.7';
	await loadLabels(formId);
	$.ajax({
		type: 'POST',
		data: {'csrf': csrf,'pFId':pFId},
		url: apiUrl + 'forms/getBody.php',
		success: async function (data) {
			p.classList.remove('loading');
			p.style.opacity='';
			if(data['success'] !== true || typeof data['success']  == "undefined"){ error(data['msg'] ? data['msg'] : "Erro ao carregar os dados"); return;}
			let c,html,r;
			r = data['data'];
			html = '';

			for(let i in cacheLabels[formId]){
				c = cacheLabels[formId][i];
				if(typeof r[c['cId']] == "undefined"){
					continue;
				}
				r[c['cId']] = desanitize(sanitize(r[c['cId']]));
				html += `${c['label']}: <b>${r[c['cId']]}</b><br>`;

			}
			p.getElementsByClassName('formBody')[0].innerHTML = html;
			p.classList.add('open');
			p.getElementsByClassName('card-body')[0].style.display ='';
		},
		error: function (){
			p.classList.remove('loading');
			p.style.opacity='';
			error("Erro ao carregar os dados");
		}
	});

}