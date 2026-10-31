# Previsão do tempo

Exercício de front-end em HTML, CSS e JavaScript. A aplicação procura uma cidade pela API de geocodificação Open-Meteo e usa as coordenadas devolvidas para consultar as condições atuais e os extremos diários.

## Executar localmente

Na pasta `clima/`, inicia um servidor HTTP estático:

```bash
python3 -m http.server 8000
```

Depois abre `http://localhost:8000` no navegador. Também podes publicar os ficheiros num alojamento estático.

## API e credenciais

A aplicação usa as APIs públicas `geocoding-api.open-meteo.com` e `api.open-meteo.com`; para o nível gratuito de avaliação e prototipagem não é necessário incluir uma chave no JavaScript. A oferta gratuita está limitada a utilização não comercial e não inclui garantia de disponibilidade. Não uses este exemplo como serviço comercial sem rever as condições atuais e obter a licença apropriada.

Os dados meteorológicos da Open-Meteo são publicados sob CC BY 4.0. Mantém a atribuição “Dados meteorológicos: Open-Meteo” visível na aplicação e indica que o fornecedor pode ser alterado. Os dados de localização têm origem no GeoNames. Consulta as condições oficiais antes de reutilizar ou redistribuir os dados:

- [Documentação da API de previsão](https://open-meteo.com/en/docs)
- [Documentação da API de geocodificação](https://open-meteo.com/en/docs/geocoding-api)
- [Planos e condições de utilização](https://open-meteo.com/en/pricing)

## Autor e percurso de desenvolvimento

**Desenvolvedor:** Benjamim Tanislau José Cacuengue.

Este trabalho faz parte do meu percurso contínuo de aprendizagem e desenvolvimento de competências. Cada projecto representa uma oportunidade prática de consolidar conhecimentos, experimentar soluções e crescer como desenvolvedor.

Nos projectos colaborativos, esta identificação não substitui os créditos e as responsabilidades dos demais membros da equipa indicados neste README.
