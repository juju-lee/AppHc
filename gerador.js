
var countInput =0;
var countRow =0;



function createElF(bt){
    countRow++;


    let html =`
      <div class="row " id="placeholderRow_${countRow}" class="rowNotReady">
            <button onclick="selSize(this,12)">12</button>
            <button onclick="selSize(this,66)">6:6</button>
            <button onclick="selSize(this,84)">8:4</button>
            <button onclick="selSize(this,48)">4:8</button>
            <button onclick="selSize(this,444)">4:4:4</button>
        </div>    
    `;

    bt.insertAdjacentHTML('beforebegin',html);

}
function selSize(bt,size){

    let parent =  bt.parentElement;
    let sizes = [];
    let row = numbers(parent.id);
    switch (size){
        case (12):{sizes.push(12);break;}
        case (66):{sizes.push(6);sizes.push(6);break;}
        case (84):{sizes.push(8);sizes.push(4);break;}
        case (48):{sizes.push(4);sizes.push(8);break;}
        case (444):{sizes.push(4);sizes.push(4);sizes.push(4);break;}
    }
    let html;
    html = ` <div class="row mb-4">`;

    for(let i =0; i < sizes.length; i++){
        countInput++;
        html += `   <div class="col-${sizes[i]} incompleteInput" row="${row}" col="${i}" colsize="${sizes[i]}" id="input_${countInput}">
                            <select class="inputtype">
                               <option value="title">Title</option>
                               <option value="subtitle">Subtitle</option>
                               <option value="shortText">shortText</option>
                               <option value="text">Text</option>
                               <option value="number">Number</option>
                               <option value="date">Date</option>
                               <option value="radio">radio</option>
                               <option value="checkbox">checkbox</option>
                               <option value="select">select</option>
                            </select>
                            <button onclick="createInput(this)">Criar campo</button>
                        </div>`;

    }

    html += ` </div>`;




    parent.innerHTML = html;

}
function numbers(str){
    if(!str){return "";}
    return str.replace(/\D/g, "");
}
function createInput(bt){
    let parent = bt.parentElement;
    let inputType = parent.getElementsByClassName('inputtype')[0].value;
    let c,html,i,j,k;
    parent.classList.remove('incompleteInput');
    parent.classList.add('validInput');
    parent.setAttribute('inputtype',inputType);

    html = `Campo ${numbers(parent.id)}<br>`;
    switch (inputType){
        case('title'):{
            html += `<input type="text" class="option" name="label" placeholder="label"> <br>`;
            html += `<input type="text" class="option" name="classes" placeholder="classes"> <br>`;
            break;
        }
        case('subtitle'):{
            html += `<input type="text" class="option" name="label" placeholder="label"> <br>`;
            html += `<input type="text" class="option" name="classes" placeholder="classes"> <br>`;
            break;
        }
        case('text'):{
            html += `<input type="text" class="option" name="label" placeholder="label"> <br>`;
            html += `<input type="text" class="option" name="placeholder" placeholder="placeholder"> <br>`;
            html += `<input type="number" class="option" name="minLength" placeholder="min length"> <br>`;
            html += `<input type="number" class="option" name="maxLength" placeholder="max length"> <br>`;
            html += `<input type="text" class="option" name="classes" placeholder="classes"> <br>`;
            break;
        }
        case('radio'):{
            html += `<input type="text" class="option" name="label" placeholder="label"> <br>`;
            html += `<input type="text" class="option" name="options" placeholder="opcoes"> <br>`;
            html += `<input type="text" class="option" name="classes" placeholder="classes"> <br>`;
            break;
        }
        case('number'):{
            html += `<input type="text" class="option" name="label" placeholder="label"> <br>`;
            html += `<input type="number" class="option" name="minLength" placeholder="min"> <br>`;
            html += `<input type="number" class="option" name="maxLength" placeholder="max"> <br>`;
            html += `<input type="text" class="option" name="classes" placeholder="classes"> <br>`;
            break;
        }
        case('shortText'):{
            html += `<input type="text" class="option" name="label" placeholder="label"> <br>`;
            html += `<input type="text" class="option" name="classes" placeholder="classes"> <br>`;
            break;
        }
        case('date'):{
            html += `<input type="text" class="option" name="label" placeholder="label"> <br>`;
            html += `<input type="text" class="option" name="classes" placeholder="classes"> <br>`;
            break;
        }
        case('checkbox'):{
            html += `<input type="text" class="option" name="label" placeholder="label"> <br>`;
            html += `<input type="text" class="option" name="options" placeholder="opcoes"> <br>`;
            html += `<input type="text" class="option" name="classes" placeholder="classes"> <br>`;
            break;
        }
        case('select'):{
            html += `<input type="text" class="option" name="label" placeholder="label"> <br>`;
            html += `<input type="text" class="option" name="options" placeholder="opcoes"> <br>`;
            html += `<input type="text" class="option" name="classes" placeholder="classes"> <br>`;
            break;
        }


    }

parent.innerHTML = html;


}

function savePage(){
    if(document.getElementsByClassName('incompleteInput').length > 0){
        alert('Vc nao fez todos os inputs');
    }
    let c,k,j,p;
    let inputs =[];

    let els = document.getElementsByClassName('validInput');
    for(let i =0; i < els.length; i++ ){
        c = els[i];
        k ={};
        k['type'] = c.getAttribute('inputtype');
        k['row'] = parseInt(c.getAttribute('row'));
        k['col'] = parseInt(c.getAttribute('col'));
        k['colsize'] = parseInt(c.getAttribute('colsize'));
        k['cfg'] = {};
        j = c.getElementsByClassName('option');
        for(let y =0; y < j.length; y++){
            p = j[y];
            k['cfg'][p.name] = p.value;
        }


        inputs.push(k);

    }
    document.getElementById('pageData').value = JSON.stringify(inputs);

}