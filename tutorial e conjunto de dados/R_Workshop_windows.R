##############################################################
########### Introdu��o ao R para linguistas ##################
########### Profa:      Mahayana Godoy      ##################
########### Monitores:  H�lis Alves         ##################
###########             Juliana Marques     ##################
###########             Matheus Mafra       ##################
########### UFRN:       Novembro de 2017    ##################
##############################################################

######################
#### INFORMA��ES #####
######################

## O presente tutorial foi desenvolvido para acompanhar as discuss�es do Workshop "Introdu��o ao R para linguistas", realizado presencialmente na UFRN em 27/11/2017. Por esse motivo, alguns dos comandos podem n�o ser t�o transparentes se forem realizados de forma independente. Sua execu��o depende do arquivo "DadosWorkshop.txt". Para mais informa��es, escreva para <psicolinguistica.ufrn@gmail.com>


#####################
#### INTRODU��O #####
#####################

## Tudo que for precedico pelo s�mbolo # em uma linha � classificado como  coment�rio
## Coment�rios n�o s�o entendidos como c�digo, e portanto o programa n�o tentar� execut�-los


## Essa linha � um coment�rio. A linha abaixo � um comando. Deixe o cursor (aquela barrinha vertical que fica piscando) na linha do comando que deseja executar e aperte CTRL+ENTER. Tente fazer isso com o comando da linha abaixo.
2+2


##Voc� viu o resultado da equa��o acima ser executado na janela abaixo

##Repita o comando com a equa��o abaixo
3+4

##Repita o comando com a fun��o abaixo
sqrt(4)

##Repita o comando com a fun��o abaixo
sqrt(81)

##Para executar mais de uma linha de c�digo, selecione tudo com o bot�o direito do mouse e aperte CTRL+ENTER
567+876
54*34
28-98
sqrt(121)

#Pronto, todos os c�digos acima foram executados de uma �nica vez na janela CONSOLE

#Vamos aprender a importar um conjunto de dados

#Precisaremos primeiro carregar os pacotes do R que usaremos nesse workshop. Carregue executando a fun��o library() abaixo:

library(readxl)  #readxl permite ler tabelas em .txt e .xls
library(ggplot2) #permite gerar gr�ficos a partir de um conjunto de dados

#A fun��o para importar um conjunto de dados � read.table(), e ela funciona assim:

### nome do conjunto = read.table("Nome do arquivo.txt", header = TRUE)

##Execute o comando abaixo para importar o conjunto dados_workshop.txt
data = read.table("DadosWorkshop.txt", header = TRUE)

##Selecione o conjunto de dados importado na janela ENVIRONMENT, � direita. Tente entend�-lo.

##########################################################
###### CRIANDO GR�FICOS DE DISPERS�O COM O GGPLOT2 #######
##########################################################

##A fun��o para criar um gr�fico do ggplot � ggplot(), e ela funciona da seguinte maneira

#ggplot(dados, aes(x=PREDITORA, y=RESPOSTA))

## Execute o c�digo abaixo para tentar criar um gr�fico de dispers�o entre idade x peso
ggplot(data, aes(x=idade, y=peso))

##OPS! Houve um erro. Isso aconteceu porque voc� n�o especificou que tipo de gr�fico voc� quer. Voc� quer um gr�fico de dispers�o. Indique isso na linha seguinte (lembre-se de unir as linhas com um sinal de +)
#Execute o comando abaixo

ggplot(data, aes(x=idade, y=peso))+
  geom_point()

##Agora vamos aumentar o tamanho dos pontos de dispers�o?
ggplot(data, aes(x=idade, y=peso))+
  geom_point(size=4)

##Ser� que homens e mulheres t�m pesos diferentes? Podemos ver isso indicando que queremos plotar os dados da coluna SEXO nos pontos do gr�fico
ggplot(data, aes(x=idade, y=peso))+
  geom_point(size=4, aes(shape=sexo))

##Vamos mudar a legenda do gr�fico? Para isso, usamos a fun��o labs() prevista no ggplot2 e inserimos, entre aspas, os nomes que queremos dar para eixo x, eixo y e para o vetor inserido na cor dos pontos.
ggplot(data, aes(x=idade, y=peso))+
  geom_point(size=4, aes(colour=sexo))+
  labs(x="Idade (anos)", y="Peso (Kg)", colour="G�nero")

##Copiando o c�digo acima, conseguimos fazer um gr�fico para ver se as horas de atividade de f�sica conseguem prever as horas de sono de uma pessoa. Basta trocar o nome das colunas no c�digo
ggplot(data, aes(x=atividadehora, y=sono))+
  geom_point(size=4)+
  labs(x="Horas de atividade f�sica por semana", y="Horas de sono por dia")

##H� muita sobreposi��o de pontos. Conseguimos ver essa sobreposi��o ajustando a opacidade dos pontos.
ggplot(data, aes(x=atividadehora, y=sono))+
  geom_point(size=4, alpha=0.2)+
  labs(x="Horas de atividade f�sica por semana", y="Horas de sono por dia")

##� bom sempre ajustarmos o alpha para um valor inferior a 1 para vermos se h� alguma sobreposi��o
## Vamos rever o primeiro gr�fico que fizemos para ver se h� sobreposi��o de algum ponto

ggplot(data, aes(x=idade, y=peso))+
  geom_point(size=4, alpha=0.3, aes(colour=sexo))+
  labs(x="Idade (anos)", y="Peso (Kg)", colour="G�nero")

######## TENTE FAZER SOZINHO 1

## Ser� que a altura prev� o tamanho do p� da pessoa?
## No mesmo gr�fico, tente ver se o pessoal da Unicamp � mais alto ou mais baixo que o pessoal da UFRN
## d� o nome de "Altura (cm)" para o eixo x e "Tamanho do cal�ado" para o eixo y









######## TENTE FAZER SOZINHO 2

# Ser� que a altura de uma pessoa prev� o seu peso?
# E a vari�vel sexo influencia essa predi��o?
# n�o se esque�a de nomear os eixos x e y









#######################################################################
###### CRIANDO GR�FICOS DE BARRA COM UMA VARI�VEL COM O GGPLOT2 #######
#######################################################################

###Gr�ficos de barra s�o interessantes para ver a quantidade/porcentagem de ocorr�ncias de vari�veis categ�ricas
## Por exemplo, em nosso conjunto de dados, ser� que temos mais respostas de alunos da Unicamp ou da UFRN?
## Plotamos o que queremos visualizar no eixo x, conforme vemos na fun��o abaixo, mas o que estar� no eixo y?

#
## ggplot(data, aes(x=instituicao, y=?))


# Podemos dizer para plotar a contagem de ocorr�ncias no eixo y com o c�digo ..count.. Tente executar o comando abaixo
ggplot(data, aes(x=instituicao, y=..count..))

## Ops, voc� n�o se esqueceu de informar que tipo de gr�fico quer fazer?
ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar()

##J� aprendemos a colocar legendas em gr�ficos. Vamos colocar nesse tamb�m.
ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar()+
  labs(x="Institui��o", y="Quantidade")

## Se eu quiser saber quantos homens e mulheres responderam ao question�rio, basta informar a coluna que codifica essa informa��o. Veja, abaixo, que repetimos o mesmo c�digo anterior, apenas substituindo "instituicao" por "sexo"
ggplot(data, aes(x=sexo, y=..count..))+
  geom_bar()+
  labs(x="Sexo", y="Quantidade")

###### TENTE FAZER SOZINHO 3

# Mostre graficamente qual a quantidade de pessoas que preferem filmes ou s�ries no nosso conjunto de dados
# Lembre-se de ajustar as legendas do seu gr�fico








###### TENTE FAZER SOZINHO 4

# Mostre graficamente qual a quantidade de pessoas que preferem gatos ou cacshorro no nosso conjunto de dados
# Lembre-se de ajustar as legendas do seu gr�fico








#########################################################################
###### CRIANDO GR�FICOS DE BARRAS COM DUAS VARI�VEIS COM O GGPLOT2 ######
#########################################################################

# �s vezes queremos informar, no gr�fico que duas popula��es diferem quanto � realiza��o de uma vari�vel. Dito de outro modo, acreditamos que uma vari�vel categ�rica consegue prever o uso de outra vari�vel categ�rica

## Por exemplo, ser� que a institui��o onde a pessoa trabalha/estuda prev� se ela fala bolacha ou biscoito?
## Podemos investigar isso pedindo que a barra seja preenchida com a vari�vel resposta.

## Primeiro fazemos um gr�fico colocando nossa vari�vel preditora no eixo x e sua quantidade de ocorr�ncias no eixo y
ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar()+
  labs(x="Institui��o", y="Quantidade de pessoas")

## Depois mudanmos a est�tica na barra para que ela reflita a vari�vel resposta. Usamos o c�digo "fill=RESPOSTA" porque estamos falando do preenchimento da barra. Execute o comando abaixo para ver.
ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar(aes(fill=dialeto))+
  labs(x="Institui��o", y="Quantidade de pessoas")

## Ser� que sexo prev� se a pessoa prefere gato ou cachorro?

## Primeiro calculamos as ocorr�ncias das vari�vel preditora
ggplot(data, aes(x=sexo, y=..count..))+
  geom_bar()+
  labs(x="Sexo", y="Quantidade de pessoas")


## Agora inserimos os detalhes sobre a vari�vel resposta
ggplot(data, aes(x=sexo, y=..count..))+
  geom_bar(aes(fill=animal))+
  labs(x="Sexo", y="Quantidade de pessoas")



###### TENTE FAZER SOZINHO 5

# Ser� que sexo prev� se a pessoa prefere filme ou s�rie?
# N�o se esque�a de ajustar a legenda do seu gr�fico







###### TENTE FAZER SOZINHO 6

# Ser� que o local onde a pessoa mora prev� se ela faz exerc�cio f�sico?
# N�o se esque�a de ajustar a legenda do seu gr�fico





######################################################
###### ADICIONANDO MAIS INFORMA��ES AO GR�FICO #######
######################################################

### Lembra que comentamos em aula que gr�ficos s�o recursivos como as frases de uma l�ngua? Se eu quiser ajustar/adicionar algum aspecto do gr�fico, basta adicionar mais informa��o no nosso c�digo. 


##Se quiser mudar as cores do gr�fico e o t�tulo da legenda, use a fun��o scale_fill_manual, que deixa manipular manualmente o preenchimento da barra. Para mudar os nomes das vari�veis no eixo x, use scale_x_discrete (j� que nosso gr�fico tem vari�veis discretas) e insira novas labels. Veja o c�digo abaixo.

ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar(aes(fill=atividade))+
  scale_fill_manual("Faz atividade f�sica?", values = c("nao" = "light blue", "sim" = "#2b8cbe"), labels=c("N�o", "Sim"))+
  scale_x_discrete(labels=c("UFRN" = "Natal", "Unicamp" = "Campinas"))+
  labs(x="Cidade", y="Quantidade de pessoas")

## Se quiser mudar a cor do fundo, use outro tema. Abaixo, escolhi o tema bw com o comando theme_bw()
ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar(aes(fill=atividade))+
  scale_fill_manual("Faz atividade f�sica?", values = c("nao" = "light blue", "sim" = "#2b8cbe"), labels=c("N�o", "Sim"))+
  scale_x_discrete(labels=c("UFRN" = "UFRN", "Unicamp" = "Unicamp"))+
  labs(x="Cidade", y="Quantidade de pessoas")+
  theme_bw()

## Se quiser colocar um contorno preto nas barras, insira essa informa��o em geom_bar, comunicando que quer um contorno preto (black) atrav�s do comando color="black"

ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar(color="black", aes(fill=atividade))+
  scale_fill_manual("Faz atividade f�sica?", values = c("nao" = "light blue", "sim" = "#2b8cbe"), labels=c("N�o", "Sim"))+
  scale_x_discrete(labels=c("UFRN" = "UFRN", "Unicamp" = "Unicamp"))+
  labs(x="Cidade", y="Quantidade de pessoas")+
  theme_bw()

## H� ainda muito mais funcionalidades no ggplot(). Se quiser saber mais, o google � seu amigo. Procure fazer as buscas em ingl�s, que � a l�ngua mais usada para perguntar/responder d�vidas sobre o [R] na internet.

##################################
### FAZENDO UM GR�FICO DO ZERO ###
##################################

#Agora � sua vez de criar a visualiza��o gr�fica de dois conjuntos de dados em dois projetos diferentes

## PROJETO 1

## O arquivo *plural.txt* tem um pequeno conjunto de dados inventados cuja cria��o foi baseada nas hip�teses que assumimos sobre a rela��o entre produ��o de concord�ncia de n�mero no sintagma nominal e grau de formalidade do discurso.

#A hip�tese geralmente assumida � a de que o contexto formal aumenta a taxa de concord�ncia no sintagma nominal

## Para fazer o gr�fico voc� dever�

## Importar o arquivo
#nome = read.table("nome_do_arquivo.txt", header = TRUE)

##Explore as colunas
#qual a coluna da vari�vel preditora?
#qual a coluna da vari�vel resposta?

##Fa�a um gr�fico considerando
# o que colocar nos eixos x e y
# que tipo de gr�fico voc� ter� (dispers�o ou barras?)
# que tipo de informa��o voc� quer mostrar
# Legendas apropriadas para eixos x e y







##PROJETO 2

## O arquivo *iwish.txt* tem um pequeno conjunto de dados inventados cuja cria��o foi baseada nas hip�teses que assumimos sobre a rela��o entre mem�ria de trabalho e profici�ncia de leitura

#A hip�tese � de que mem�ria de trabalho prev� profici�ncia de leitura, e questiona-se se o modo de apresenta��o teria algum efeito nessa suposta previs�o

## Para fazer o gr�fico voc� dever�

## Importar o arquivo
#nome = read.table("nome_do_arquivo.txt", header = TRUE)

##Explore as colunas
#qual a coluna da vari�vel preditora?
#qual a coluna da vari�vel resposta?

##Fa�a um gr�fico considerando
# o que colocar nos eixos x e y
# que tipo de gr�fico voc� ter� (dispers�o ou barras?)
# que tipo de informa��o voc� quer mostrar
# Legendas apropriadas para eixos x e y


