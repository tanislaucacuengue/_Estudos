document.querySelector('#pesquisa').addEventListener('submit', async (event) => {
    event.preventDefault();

    const cityNome = document.querySelector('#city_nome').value;

    if (!cityNome) {
         document.querySelector('#clima').classList.remove('show');
        showAlert('Você precisa digitar o nome de uma cidade...');
        return;
    }

    const chaveapi = `af2e03141a2bbb2479f844146cea13ef`;
    const apiurl = `https://api.openweathermap.org/data/2.5/weather?q=${encodeURI(cityNome)}&appid=${chaveapi}&units=metric&lang=pt_br`;
    const resultado = await fetch(apiurl);
    const json = await resultado.json();

    if (json.cod === 200) {
        showinfo({
            cidade: json.name,
            pais: json.sys.country,
            temp: json.main.temp,
            tempMax: json.main.temp_max,
            tempMin: json.main.temp_min,
            descricao: json.weather[0].description,
            tempIcone: json.weather[0].icon,
            vento: json.wind.speed,
            umidade: json.main.humidity,
        });
    }

    else{

         document.querySelector('#clima').classList.remove('show');
        showAlert(`
            Não foi possivel localizar...
            
            <img src="src/image/2.svg" alt="Imagem resultado não encontrado"/>

            
            `)
        
    }

});

function showinfo(json) {
    document.querySelector('#clima').classList.add('show');

    document.querySelector('#titulo').innerHTML = `${json.cidade}, ${json.pais}`;

    document.querySelector('#temp_valor').innerHTML = `${json.temp.toFixed(1).toString().replace('.', ',')} <sup>Cº</sup>`;

    document.querySelector('#temp_descricao').innerHTML = `${json.descricao}`;

    document.querySelector('#temp_img').setAttribute('src', `https://openweathermap.org/img/wn/${json.tempIcone}.png`);

    document.querySelector('#temp_max').innerHTML = `${json.tempMax.toFixed(1).toString().replace('.', ',')} <sup>Cº</sup>`;

    document.querySelector('#temp_min').innerHTML = `${json.tempMin.toFixed(1).toString().replace('.', ',')} <sup>Cº</sup>`;

    document.querySelector('#umid').innerHTML = `${json.umidade}%`;

    document.querySelector('#vento').innerHTML = `${json.vento.toFixed(1)}km/h`;
}

function showAlert(msg) {
    document.querySelector('#alert').innerHTML = msg;
}