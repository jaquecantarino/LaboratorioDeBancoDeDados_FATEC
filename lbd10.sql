/* 1-Quais as principais diferenças entre um banco de dados relacional e um banco de dados NOSQL
bancos de dados relacionais usam um esquema explícito para armazenar dados, com uma estrutura bem definida, 
enquanto o NOSQL não usa tabelas com colunas e linhas, pode-se implementar diferentes modelos.
*/

/*2-Quais as principais motivações para usar um banco de dados NOSQL
Os bancos de dados NOSQL são mais flexiveis, e podem armazenar tipos mais complexos de dados;
*/

/*3-O que e uma coleção e o que e um documento no conceito de banco de dados orientado a documentos?
Uma coleção é um conjunto de documentos, e a junção de diversas coleções é um banco de dados.
Banco de dados orientados a documentos recebem dados em um formato semi-estruturado, em JASON normalmente.
*/
/*4-Escreva um documento em JSON para representar um PEDIDO usado nas estruturas relacionais anteriores*/
{
   "pedido":[
      {
         "numero":12345,
         "data":"15/11/2021",
         "total":700.00,
         "cliente":{
            "id":1,
            "nome":"Ana",
            "email":"ana@email.com",
            "telefone":"98574-7456"
         },
         "vendedor":{
            "id":1,
            "nome":"Betina",
            "email":"betina@email.com"
         },
         "items":[
            {
               "id":1,
               "valor":450.00
            },
            {
               "id":2,
               "valor":250.00
            }
         ]
      },
      {
         "numero":23456,
         "data":"16/11/2021",
         "total":2200.00,
         "cliente":{
            "id":1,
            "nome":"Ana",
            "email":"ana@email.com",
            "telefone":"98574-7456"
         },
         "vendedor":{
            "id":1,
            "nome":"Betina",
            "email":"betina@email.com"
         },
         "items":[
            {
               "id":4,
               "valor":1500.00
            },
            {
               "id":5,
               "valor":600.00
            }
         ]
      }
   ]
}


/*5-Escreva um documento em JSON para representar um PRODUTO usado nas estruturas relacionais anteriores*/
{
   "produto":[
      {
         "id":4,
         "nome":"Geladeira",
         "valor":1500.00,
         "pedido":[
            {
               "numero":"23456",
               "data":"16/11/2021"
            }
         ]
      },
      {
         "id":5,
         "nome":"Mesa de Jantar",
         "valor":600.00,
         "pedido":[
            {
               "numero":"23456",
               "data":"16/11/2021"
            }
         ]
      },
      {
         "id":1,
         "nome":"Fogão Simples",
         "valor":450.00,
         "pedido":[
            {
               "numero":"12345",
               "data":"15/11/2021"
            }
         ]
      }
   ]
}
