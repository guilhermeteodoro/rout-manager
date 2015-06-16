# rout-manager
A webservice to insert maps (locations and the distance in between) and calculate the best route.

### Desafio

Um sistema de entregas visando sempre o menor custo. Para popular sua base de dados o sistema precisa expor um
webservice que aceite o formato de malha logística (exemplo abaixo), nesta mesma
requisição o requisitante deverá informar um nome para este mapa. É importante que os
mapas sejam persistidos para evitar que a cada novo deploy todas as informações
desapareçam. O formato de malha logística é bastante simples, cada linha mostra uma rota:
ponto de origem, ponto de destino e distância entre os pontos em quilômetros.

>A B 10
B D 15
A C 20
C D 30
B E 50
D E 30

Com os mapas carregados o requisitante irá procurar o menor valor de entrega e seu caminho,
para isso ele passará o mapa, nome do ponto de origem, nome do ponto de destino,
autonomia do caminhão `(km/l)` e o valor do litro do combustível, agora sua tarefa é criar este
webservice. Um exemplo de entrada seria, mapa SP, origem A, destino D, autonomia 10,
valor do litro 2,50; a resposta seria a rota A B D com custo de 6,25.

Exemplo de chamada:

```json
{
    "name": "SP",
    "routes": [{
        "distance": 10,
        "origin": "A",
        "destination": "B"
    }, {
        "distance": 15,
        "origin": "B",
        "destination": "D"
    }, {
        "distance": 20,
        "origin": "A",
        "destination": "C"
    }, {
        "distance": 30,
        "origin": "C",
        "destination": "D"
    }, {
        "distance": 50,
        "origin": "B",
        "destination": "E"
    }, {
        "distance": 30,
        "origin": "D",
        "destination": "E"
    }]
}
```