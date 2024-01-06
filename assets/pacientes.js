
document.addEventListener("DOMContentLoaded", async function(){
	document.getElementById('tipoBusca').value ='nome';
	document.getElementById('buscaPaciente').value ='';
});

function loadPatients(){

	let type ='';
	let search ='';
	if(document.getElementById('tipoBusca')){
		type = document.getElementById('tipoBusca').value;
	}
	if(document.getElementById('buscaPaciente')){
		search = document.getElementById('buscaPaciente').value;
	}

	// "pacienteId": "3",
	// 	"nome": "fffff",
	// 	"registroHC": "0000004444",
	// 	"nascimento": "0004-04-04",
	// 	"genero": "Masculino",
	// 	"estadoCivil": "Casado(a)",
	// 	"estado": "Ac",
	// 	"cidade": "4444444444444",
	// 	"criadoEm": "2023-11-26 18:14:18"

    $.ajax({
    	type: 'POST',
    	data: {'csrf': csrf,'type':type,'search':search},
    	url: apiUrl + 'patients/list.php',
    	success: async function (data) {
    		if(data['success'] !== true || typeof data['success']  == "undefined"){ error(data['msg'] ? data['msg'] : "Erro ao carregar os dados"); return;}
            await locksLoad;
			document.getElementById('patientsBody').innerHTML='';
            let c,html,nasc;
            for(let i in data['data']){
                c = data['data'][i];
				nasc = c['nascimento'].split('-');
				nasc = nasc[2]+'/'+nasc[1]+'/'+nasc[0];

                html = `  <tr>
                            <td>${c['nome']}</td>
                            <td>${c['registroHC']}</td>
                            <td>${nasc} - ${getAge(c['nascimento'])} anos</td>
                            <td><a href="paciente.html?pacienteId=${c['pacienteId']}" class="btnPaciente">Visualizar Paciente</a></td>
                        </tr>`;
				document.getElementById('patientsBody').insertAdjacentHTML('beforeend',html);
            }
    	},
    	error: function (){
    		error("Erro ao carregar os dados");
    	}
    });

}
loadPatients();

