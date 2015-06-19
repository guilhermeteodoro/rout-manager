# rout-manager

**rout-manager** é um webservice que resolve o melhor caminho (custo menor) entre duas localidades e retorna a rota calculada e seu custo.

O web service trabalha com uma interface RESTful, aceita e
responde somente a entradas objetos **json** e persiste os dados
utilizando-se das seguintes entidades:

* **Mapa** (map): possui apenas um nome (string).
* **Caminhos** (path): possui um ponto de origem (string), destino (string) e a
  distância (double) entre os mesmos.

Após a entrada do mapa e suas estradas no sistema, pode-se pedir
a solução do menor caminho (o caminho que possui a menor distância)
entre duas localidades, dado que estas localidades estejam conectadas
entre si de alguma forma, diretamente ou passando por outras estradas.

Para o cálculo da solução, utiliza-se de uma versão do algoritmo de **Dijkstra**.

## Requerimentos

Clone o projeto e entre no diretório

```bash
git clone git@github.com:guilhermeteodoro/rout-manager.git
```

Com o Ruby 2.1.0 instalado na máquina

```bash
bundle install
rake db:migrate
```

## Como utilizar

Inicie o servidor

```bash
rails server
```

Um servidor web estará escutando na porta 3000 da máquina local a partir
deste momento - http://localhost:3000 ou http://0.0.0.0:3000.

### Criação do mapa

**Exemplo de requisição:**

- **POST** [http://0.0.0.0:8080/maps/](http://0.0.0.0:8080/maps/)
- **Accept:** application/json
- **Content-Type:** application/json

```json
	{ 
		map: {
			"name": "SP",
			"routes": [
				{
					"distance": 10,
					"origin": "A",
					"destination": "B"
				},
				{
					"distance": 15,
					"origin": "B",
					"destination": "D"
				},
				{
					"distance": 20,
					"origin": "A",
					"destination": "C"
				},
				{
					"distance": 30,
					"origin": "C",
					"destination": "D"
				},
				{
					"distance": 50,
					"origin": "B",
					"destination": "E"
				},
				{
					"distance": 30,
					"origin": "D",
					"destination": "E"
				}
			]
		}
	}
```

**Exemplo de resposta:**

- **201** CREATED

### Menor caminho

**Exemplo de requisição:**

- **GET** [http://0.0.0.0:8080/maps/SP/route/solve/](http://0.0.0.0:8080/maps/SP/route/solve/)
- **Accept:** application/json
- **Content-Type:** application/json

**Exemplo de resposta:**

- **200** OK

```html
	{
		"distance": 25,
		"cost": 6.25,
		"route": [
			"A",
			"B",
			"D"
		]
	}
```