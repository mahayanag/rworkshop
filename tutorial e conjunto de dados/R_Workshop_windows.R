##############################################################
########### Introdução ao R para linguistas ##################
########### Profa:      Mahayana Godoy      ##################
########### Monitores:  Hális Alves         ##################
###########             Juliana Marques     ##################
###########             Matheus Mafra       ##################
########### UFRN:       Novembro de 2017    ##################
##############################################################

######################
#### INFORMAÇÕES #####
######################

## O presente tutorial foi desenvolvido para acompanhar as discussões do Workshop "Introdução ao R para linguistas", realizado presencialmente na UFRN em 27/11/2017. Por esse motivo, alguns dos comandos podem não ser tão transparentes se forem realizados de forma independente. Sua execução depende do arquivo "DadosWorkshop.txt". Para mais informações, escreva para <psicolinguistica.ufrn@gmail.com>


#####################
#### INTRODUÇÃO #####
#####################

## Tudo que for precedico pelo símbolo # em uma linha é classificado como  comentário
## Comentários não são entendidos como código, e portanto o programa não tentará executá-los


## Essa linha é um comentário. A linha abaixo é um comando. Deixe o cursor (aquela barrinha vertical que fica piscando) na linha do comando que deseja executar e aperte CTRL+ENTER. Tente fazer isso com o comando da linha abaixo.
2+2


##Você viu o resultado da equação acima ser executado na janela abaixo

##Repita o comando com a equação abaixo
3+4

##Repita o comando com a função abaixo
sqrt(4)

##Repita o comando com a função abaixo
sqrt(81)

##Para executar mais de uma linha de código, selecione tudo com o botão direito do mouse e aperte CTRL+ENTER
567+876
54*34
28-98
sqrt(121)

#Pronto, todos os códigos acima foram executados de uma única vez na janela CONSOLE

#Vamos aprender a importar um conjunto de dados

#Precisaremos primeiro carregar os pacotes do R que usaremos nesse workshop. Carregue executando a função library() abaixo:

library(readxl)  #readxl permite ler tabelas em .txt e .xls
library(ggplot2) #permite gerar gráficos a partir de um conjunto de dados

#A função para importar um conjunto de dados é read.table(), e ela funciona assim:

### nome do conjunto = read.table("Nome do arquivo.txt", header = TRUE)

##Execute o comando abaixo para importar o conjunto dados_workshop.txt
data = read.table("DadosWorkshop.txt", header = TRUE)

##Selecione o conjunto de dados importado na janela ENVIRONMENT, à direita. Tente entendê-lo.

##########################################################
###### CRIANDO GRÁFICOS DE DISPERSÃO COM O GGPLOT2 #######
##########################################################

##A função para criar um gráfico do ggplot é ggplot(), e ela funciona da seguinte maneira

#ggplot(dados, aes(x=PREDITORA, y=RESPOSTA))

## Execute o código abaixo para tentar criar um gráfico de dispersão entre idade x peso
ggplot(data, aes(x=idade, y=peso))

##OPS! Houve um erro. Isso aconteceu porque você não especificou que tipo de gráfico você quer. Você quer um gráfico de dispersão. Indique isso na linha seguinte (lembre-se de unir as linhas com um sinal de +)
#Execute o comando abaixo

ggplot(data, aes(x=idade, y=peso))+
  geom_point()

##Agora vamos aumentar o tamanho dos pontos de dispersão?
ggplot(data, aes(x=idade, y=peso))+
  geom_point(size=4)

##Será que homens e mulheres têm pesos diferentes? Podemos ver isso indicando que queremos plotar os dados da coluna SEXO nos pontos do gráfico
ggplot(data, aes(x=idade, y=peso))+
  geom_point(size=4, aes(shape=sexo))

##Vamos mudar a legenda do gráfico? Para isso, usamos a função labs() prevista no ggplot2 e inserimos, entre aspas, os nomes que queremos dar para eixo x, eixo y e para o vetor inserido na cor dos pontos.
ggplot(data, aes(x=idade, y=peso))+
  geom_point(size=4, aes(colour=sexo))+
  labs(x="Idade (anos)", y="Peso (Kg)", colour="Gênero")

##Copiando o código acima, conseguimos fazer um gráfico para ver se as horas de atividade de física conseguem prever as horas de sono de uma pessoa. Basta trocar o nome das colunas no código
ggplot(data, aes(x=atividadehora, y=sono))+
  geom_point(size=4)+
  labs(x="Horas de atividade física por semana", y="Horas de sono por dia")

##Há muita sobreposição de pontos. Conseguimos ver essa sobreposição ajustando a opacidade dos pontos.
ggplot(data, aes(x=atividadehora, y=sono))+
  geom_point(size=4, alpha=0.2)+
  labs(x="Horas de atividade física por semana", y="Horas de sono por dia")

##É bom sempre ajustarmos o alpha para um valor inferior a 1 para vermos se há alguma sobreposição
## Vamos rever o primeiro gráfico que fizemos para ver se há sobreposição de algum ponto

ggplot(data, aes(x=idade, y=peso))+
  geom_point(size=4, alpha=0.3, aes(colour=sexo))+
  labs(x="Idade (anos)", y="Peso (Kg)", colour="Gênero")

######## TENTE FAZER SOZINHO 1

## Será que a altura prevê o tamanho do pé da pessoa?
## No mesmo gráfico, tente ver se o pessoal da Unicamp é mais alto ou mais baixo que o pessoal da UFRN
## dê o nome de "Altura (cm)" para o eixo x e "Tamanho do calçado" para o eixo y









######## TENTE FAZER SOZINHO 2

# Será que a altura de uma pessoa prevê o seu peso?
# E a variável sexo influencia essa predição?
# não se esqueça de nomear os eixos x e y









#######################################################################
###### CRIANDO GRÁFICOS DE BARRA COM UMA VARIÁVEL COM O GGPLOT2 #######
#######################################################################

###Gráficos de barra são interessantes para ver a quantidade/porcentagem de ocorrências de variáveis categóricas
## Por exemplo, em nosso conjunto de dados, será que temos mais respostas de alunos da Unicamp ou da UFRN?
## Plotamos o que queremos visualizar no eixo x, conforme vemos na função abaixo, mas o que estará no eixo y?

#
## ggplot(data, aes(x=instituicao, y=?))


# Podemos dizer para plotar a contagem de ocorrências no eixo y com o código ..count.. Tente executar o comando abaixo
ggplot(data, aes(x=instituicao, y=..count..))

## Ops, você não se esqueceu de informar que tipo de gráfico quer fazer?
ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar()

##Já aprendemos a colocar legendas em gráficos. Vamos colocar nesse também.
ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar()+
  labs(x="Instituição", y="Quantidade")

## Se eu quiser saber quantos homens e mulheres responderam ao questionário, basta informar a coluna que codifica essa informação. Veja, abaixo, que repetimos o mesmo código anterior, apenas substituindo "instituicao" por "sexo"
ggplot(data, aes(x=sexo, y=..count..))+
  geom_bar()+
  labs(x="Sexo", y="Quantidade")

###### TENTE FAZER SOZINHO 3

# Mostre graficamente qual a quantidade de pessoas que preferem filmes ou séries no nosso conjunto de dados
# Lembre-se de ajustar as legendas do seu gráfico








###### TENTE FAZER SOZINHO 4

# Mostre graficamente qual a quantidade de pessoas que preferem gatos ou cacshorro no nosso conjunto de dados
# Lembre-se de ajustar as legendas do seu gráfico








#########################################################################
###### CRIANDO GRÁFICOS DE BARRAS COM DUAS VARIÁVEIS COM O GGPLOT2 ######
#########################################################################

# Às vezes queremos informar, no gráfico que duas populações diferem quanto à realização de uma variável. Dito de outro modo, acreditamos que uma variável categórica consegue prever o uso de outra variável categórica

## Por exemplo, será que a instituição onde a pessoa trabalha/estuda prevê se ela fala bolacha ou biscoito?
## Podemos investigar isso pedindo que a barra seja preenchida com a variável resposta.

## Primeiro fazemos um gráfico colocando nossa variável preditora no eixo x e sua quantidade de ocorrências no eixo y
ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar()+
  labs(x="Instituição", y="Quantidade de pessoas")

## Depois mudanmos a estética na barra para que ela reflita a variável resposta. Usamos o código "fill=RESPOSTA" porque estamos falando do preenchimento da barra. Execute o comando abaixo para ver.
ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar(aes(fill=dialeto))+
  labs(x="Instituição", y="Quantidade de pessoas")

## Será que sexo prevê se a pessoa prefere gato ou cachorro?

## Primeiro calculamos as ocorrências das variável preditora
ggplot(data, aes(x=sexo, y=..count..))+
  geom_bar()+
  labs(x="Sexo", y="Quantidade de pessoas")


## Agora inserimos os detalhes sobre a variável resposta
ggplot(data, aes(x=sexo, y=..count..))+
  geom_bar(aes(fill=animal))+
  labs(x="Sexo", y="Quantidade de pessoas")



###### TENTE FAZER SOZINHO 5

# Será que sexo prevê se a pessoa prefere filme ou série?
# Não se esqueça de ajustar a legenda do seu gráfico







###### TENTE FAZER SOZINHO 6

# Será que o local onde a pessoa mora prevê se ela faz exercício físico?
# Não se esqueça de ajustar a legenda do seu gráfico





######################################################
###### ADICIONANDO MAIS INFORMAÇÕES AO GRÁFICO #######
######################################################

### Lembra que comentamos em aula que gráficos são recursivos como as frases de uma língua? Se eu quiser ajustar/adicionar algum aspecto do gráfico, basta adicionar mais informação no nosso código. 


##Se quiser mudar as cores do gráfico e o título da legenda, use a função scale_fill_manual, que deixa manipular manualmente o preenchimento da barra. Para mudar os nomes das variáveis no eixo x, use scale_x_discrete (já que nosso gráfico tem variáveis discretas) e insira novas labels. Veja o código abaixo.

ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar(aes(fill=atividade))+
  scale_fill_manual("Faz atividade física?", values = c("nao" = "light blue", "sim" = "#2b8cbe"), labels=c("Não", "Sim"))+
  scale_x_discrete(labels=c("UFRN" = "Natal", "Unicamp" = "Campinas"))+
  labs(x="Cidade", y="Quantidade de pessoas")

## Se quiser mudar a cor do fundo, use outro tema. Abaixo, escolhi o tema bw com o comando theme_bw()
ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar(aes(fill=atividade))+
  scale_fill_manual("Faz atividade física?", values = c("nao" = "light blue", "sim" = "#2b8cbe"), labels=c("Não", "Sim"))+
  scale_x_discrete(labels=c("UFRN" = "UFRN", "Unicamp" = "Unicamp"))+
  labs(x="Cidade", y="Quantidade de pessoas")+
  theme_bw()

## Se quiser colocar um contorno preto nas barras, insira essa informação em geom_bar, comunicando que quer um contorno preto (black) através do comando color="black"

ggplot(data, aes(x=instituicao, y=..count..))+
  geom_bar(color="black", aes(fill=atividade))+
  scale_fill_manual("Faz atividade física?", values = c("nao" = "light blue", "sim" = "#2b8cbe"), labels=c("Não", "Sim"))+
  scale_x_discrete(labels=c("UFRN" = "UFRN", "Unicamp" = "Unicamp"))+
  labs(x="Cidade", y="Quantidade de pessoas")+
  theme_bw()

## Há ainda muito mais funcionalidades no ggplot(). Se quiser saber mais, o google é seu amigo. Procure fazer as buscas em inglês, que é a língua mais usada para perguntar/responder dúvidas sobre o [R] na internet.

##################################
### FAZENDO UM GRÁFICO DO ZERO ###
##################################

#Agora é sua vez de criar a visualização gráfica de dois conjuntos de dados em dois projetos diferentes

## PROJETO 1

## O arquivo *plural.txt* tem um pequeno conjunto de dados inventados cuja criação foi baseada nas hipóteses que assumimos sobre a relação entre produção de concordância de número no sintagma nominal e grau de formalidade do discurso.

#A hipótese geralmente assumida é a de que o contexto formal aumenta a taxa de concordância no sintagma nominal

## Para fazer o gráfico você deverá

## Importar o arquivo
#nome = read.table("nome_do_arquivo.txt", header = TRUE)

##Explore as colunas
#qual a coluna da variável preditora?
#qual a coluna da variável resposta?

##Faça um gráfico considerando
# o que colocar nos eixos x e y
# que tipo de gráfico você terá (dispersão ou barras?)
# que tipo de informação você quer mostrar
# Legendas apropriadas para eixos x e y







##PROJETO 2

## O arquivo *iwish.txt* tem um pequeno conjunto de dados inventados cuja criação foi baseada nas hipóteses que assumimos sobre a relação entre memória de trabalho e proficiência de leitura

#A hipótese é de que memória de trabalho prevê proficiência de leitura, e questiona-se se o modo de apresentação teria algum efeito nessa suposta previsão

## Para fazer o gráfico você deverá

## Importar o arquivo
#nome = read.table("nome_do_arquivo.txt", header = TRUE)

##Explore as colunas
#qual a coluna da variável preditora?
#qual a coluna da variável resposta?

##Faça um gráfico considerando
# o que colocar nos eixos x e y
# que tipo de gráfico você terá (dispersão ou barras?)
# que tipo de informação você quer mostrar
# Legendas apropriadas para eixos x e y


