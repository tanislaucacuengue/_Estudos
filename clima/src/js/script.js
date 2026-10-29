const form = document.querySelector('#pesquisa');
const cityInput = document.querySelector('#city_nome');
const climatePanel = document.querySelector('#clima');
const alertPanel = document.querySelector('#alert');
const submitButton = form.querySelector('button');

const weatherDescriptions = {
    0: 'Céu limpo',
    1: 'Predominantemente limpo',
    2: 'Parcialmente nublado',
    3: 'Nublado',
    45: 'Nevoeiro',
    48: 'Nevoeiro com geada',
    51: 'Chuvisco ligeiro',
    53: 'Chuvisco moderado',
    55: 'Chuvisco intenso',
    56: 'Chuvisco gelado ligeiro',
    57: 'Chuvisco gelado intenso',
    61: 'Chuva ligeira',
    63: 'Chuva moderada',
    65: 'Chuva intensa',
    66: 'Chuva gelada ligeira',
    67: 'Chuva gelada intensa',
    71: 'Queda de neve ligeira',
    73: 'Queda de neve moderada',
    75: 'Queda de neve intensa',
    77: 'Grãos de neve',
    80: 'Aguaceiros ligeiros',
    81: 'Aguaceiros moderados',
    82: 'Aguaceiros fortes',
    85: 'Aguaceiros de neve ligeiros',
    86: 'Aguaceiros de neve fortes',
    95: 'Trovoada',
    96: 'Trovoada com granizo ligeiro',
    99: 'Trovoada com granizo forte',
};

function describeWeather(code) {
    return weatherDescriptions[code] ?? 'Condição meteorológica desconhecida';
}

function iconForWeather(code, isDay) {
    if (code === 0) return isDay ? 'fa-sun' : 'fa-moon';
    if (code === 1 || code === 2) return isDay ? 'fa-cloud-sun' : 'fa-cloud-moon';
    if (code === 3) return 'fa-cloud';
    if (code === 45 || code === 48) return 'fa-smog';
    if ((code >= 71 && code <= 77) || code === 85 || code === 86) return 'fa-snowflake';
    if (code >= 95) return 'fa-cloud-bolt';
    if ((code >= 51 && code <= 67) || (code >= 80 && code <= 82)) return 'fa-cloud-rain';
    return 'fa-cloud';
}

function showAlert(message) {
    alertPanel.textContent = message;
}

function formatTemperature(value) {
    return Number.isFinite(value) ? `${value.toFixed(1).replace('.', ',')} °C` : '—';
}

async function fetchJson(url) {
    const response = await fetch(url);
    if (!response.ok) {
        throw new Error(`Pedido falhou (${response.status})`);
    }
    return response.json();
}

async function findLocation(city) {
    const url = new URL('https://geocoding-api.open-meteo.com/v1/search');
    url.search = new URLSearchParams({
        name: city,
        count: '1',
        language: 'pt',
        format: 'json',
    });
    const result = await fetchJson(url);
    return result.results?.[0] ?? null;
}

async function fetchWeather(location) {
    const url = new URL('https://api.open-meteo.com/v1/forecast');
    url.search = new URLSearchParams({
        latitude: String(location.latitude),
        longitude: String(location.longitude),
        current: 'temperature_2m,relative_humidity_2m,weather_code,wind_speed_10m,is_day',
        daily: 'temperature_2m_max,temperature_2m_min',
        forecast_days: '1',
        timezone: 'auto',
        temperature_unit: 'celsius',
        wind_speed_unit: 'kmh',
    });
    return fetchJson(url);
}

function renderWeather(location, data) {
    const current = data.current;
    const daily = data.daily;
    if (!current || !daily) {
        throw new Error('A resposta meteorológica não contém os dados esperados.');
    }

    const country = location.country_code || location.country || '';
    document.querySelector('#titulo').textContent = country
        ? `${location.name}, ${country}`
        : location.name;
    document.querySelector('#temp_valor').textContent = formatTemperature(current.temperature_2m);
    document.querySelector('#temp_descricao').textContent = describeWeather(current.weather_code);
    document.querySelector('#temp_max').textContent = formatTemperature(daily.temperature_2m_max?.[0]);
    document.querySelector('#temp_min').textContent = formatTemperature(daily.temperature_2m_min?.[0]);
    document.querySelector('#umid').textContent = Number.isFinite(current.relative_humidity_2m)
        ? `${current.relative_humidity_2m}%`
        : '—';
    document.querySelector('#vento').textContent = Number.isFinite(current.wind_speed_10m)
        ? `${current.wind_speed_10m.toFixed(1).replace('.', ',')} km/h`
        : '—';

    const icon = document.querySelector('#temp_icon');
    icon.className = `fa-solid ${iconForWeather(current.weather_code, current.is_day === 1)}`;
    climatePanel.classList.add('show');
}

form.addEventListener('submit', async (event) => {
    event.preventDefault();
    const city = cityInput.value.trim();
    if (city.length < 2) {
        climatePanel.classList.remove('show');
        showAlert('Escreve o nome de uma cidade com pelo menos duas letras.');
        return;
    }

    showAlert('A procurar condições meteorológicas…');
    submitButton.disabled = true;
    climatePanel.classList.remove('show');

    try {
        const location = await findLocation(city);
        if (!location) {
            showAlert('Não foi possível encontrar essa cidade. Confirma o nome e tenta novamente.');
            return;
        }

        const weather = await fetchWeather(location);
        renderWeather(location, weather);
        showAlert('');
    } catch (error) {
        showAlert('Não foi possível obter a previsão agora. Verifica a ligação e tenta novamente.');
    } finally {
        submitButton.disabled = false;
    }
});
