# IAAD-Projeto
Projeto de companhia aérea somente destinado a cadeira de Introdução Ao Armazenamento de Dados da Universidade Federal Rural de Pernambuco(UFRPE).

# Banco de Dados
Todas as tabelas foram criadas e desenvolvidas a partir do esquema e diagrama de Entidade-Relacionamento de 'Companhia Aérea' a fim de criar o projeto final da cadeira de Introdução ao Armazenamento da Dados da Universidade Federal Rural de Pernambuco. 
<br>
- Triggers (Gatilhos)<br>

    Os gatilhos são acionados quando uma reserva é feita ou quando uma reserva é deletada, a função dos gatilhos é aumentar o número de vagas quando uma reserva for cancelada, ou diminuir quando uma reserva for realizada. 

    Outro gatilho também é de desconto, em que todos dos vôos recebem desconto de 15%. 

- Stored Procedure (Procedimento de Armazenamento)<br>
   A SP foi criada para que o usuário informe o Numero do voo e visualizar uma espécie de detalhamento do voo, como aeroportos em que ha esse voo, companias aéreas, cidades e estados que estão esses aeroportos. 

- Consultas <br>
i) A primeira consulta demonstra uma tabela no qual há o nome das companias aéreas e média de tarifa de acordo com cada voo. <br>
ii) A segunda consulta demonstra uma tabela com a quantidade de vôos que partem de cada aeroporto. 
