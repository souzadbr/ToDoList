# Projeto: ToDoList

## uso da aplicação: 

Aplicação com tela LaunchScreem que navega para a tela principal. Tela principal
foi feita com base em uma TableView que recebe os titulos das tarefas. 
Na mesma célula que cada titulo aparece temos uma lixeira onde é possivel excluir
essa tarefa da lista. 

No Header da tela ou Navigation bar temos um botão (+) no qual faz subir uma
modal e nela é possivel preencher informações para uma nova tarefa e salva-la na
lista refletindo isso numa atualização da TableView na tela principal no primeir0
momento .

Essa tela de nova tarefa deve ser preenchida, caso tenha itens em branco teremos
um  alert informando o usuário sobre isso. 

Ao Clicar na célula com titulo da tarefa, abre outra tela de detalhes, na qual
você poderia ver o titulo da tarefa, descricao e quando foi criado (Não acabei
essa funcionalidade, as labels e pickerData não estão recebendo a informação)

Na tela de detalhes temos um botão de editar que nos leva a uma tela que onde
textFields receberiam as informacoes e o usuário poderia ajustar elas digitando e
salva-las (não finalizei, tela não está recebendo as informações no textField e
há um bug chamando a tela duas vezes sobreposta, tanto na ida quanto na volta). 

Bom, isso estava buildando até eu decidir adicionar os arquivos do CoreData, 
criei uma entidade e seus atributos, adicionei uma func no appDelegate e fiz um
arquivo no Manager (estão todos comentados, porém mesmo assim por não ter havido
as devidas refatarações o app está crashando). 

#Projeto feito em storyboard 

Lista do que fazer para finalizar projeto:

- Verificar código para entender o bug de navegação na jornada de editar.  
- Verificar código para entender o que falta para enviar os dados para tela de detalhe com as informações da célula. 
- Tendo a tela de detalhes funcionando recebendo o dados, passar esses dados para tela de editar. 
- Refatorar usando métodos do CoreData (tanto salvar, deletar, editar, retornar dados) - classe comentada no projeto. 



