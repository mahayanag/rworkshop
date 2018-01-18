# rworkshop
Slides, script e conjunto de dados para o workshop Introdução ao R para linguistas (UFRN/2017)

O objetivo do curso foi introduzir o uso do RStudio para o tratamento de dados de pesquisas linguísticas através do uso do pacote ggplot2. Segue uma descrição de cada arquivo:

# slides.html
slides para o tutorial. Note que o uso das setas direita/esquerda no teclado movimentam a apresentação mostrando as seções principais da apresentação. Para ver os slides dentro de cada seção, use as setas indicando para cima/para baixo. No canto inferior esquerdo há um cursor indicando esses movimentos. 

# tutorial e conjunto de dados 
pasta com os arquivos a serem usados para rodar os códigos apresentados nos slides. Os arquivos presentes na pasta são os seguintes: 

## R_Workshop.R  e R_Workshop_windows.R 
Tutorial com os códigos comentados utilizados nos slides. A versão windows é disponibilizada aqui para evitar problemas com os acentos se esse sistema operacional for utilizado. O tutorial funciona melhor se aberto diretamente no RStudio (cf. seção "Vamos dar uma olhada em como iniciar uma seção no RStudio" nos slides).  

## DadosWorkshop.txt
Conjunto de dados para realizar o tutorial. Esse conjunto é uma pequena amostra de um questionário preenchido pelas comunidades acadêmicas da UFRN e da Unicamp. Os participantes responderam informando sexo (coluna "sexo"), idade (coluna "idade"), altura em cm, (coluna "altura"), peso em kg (coluna "peso"), tamanho do pé (coluna "pe"), instituição em que estuda/trabalha (coluna "instituicao"), preferência pelo uso da palavra "bolacha" ou "biscoito" (coluna "dialeto"), preferência por assistir séries ou filmes (coluna "assistir"), preferência por gato ou cachorro (coluna "animal"), horas de sono por dia (coluna "sono"), realização ou não de atividade física (coluna "atividade") e horas dedicadas a atividade física na semana (coluna "atividadehora").
    
## concordancia.txt
Conjunto de dados para realizar o Projeto 1. Ele traz os resultados de um conjunto de dados fictício sobre a realização ou não de concordância plural no sintagma nominal. As colunas indicam nome do participante (coluna "participante"), idade (coluna "idade"), sexo (coluna "sexo"), contexto de produção da fala (coluna "contexto"), e ocorrência de concordância (coluna "concordancia"). Na coluna "contexto", são codificados os contextos de fala enquanto o informante ministra uma aula ("aula") ou enquanto participa de uma conversa informal espontânea ("espontânea"). Na coluna "concordancia" codifica-se se na ocorrência de um sintagma nominal houve concordância ("concorda") ou não ("nconcorda"). 

## iwish.txt
Conjunto de dados para realizar o Projeto 2. Ele traz os resultados de um conjunto de dados fictício sobre a relação entre memória de trabalho e pontuação em uma atividade de leitura. As colunas indicam o número do sujeito participante (coluna "NSuj"), a pontuação em uma tarefa de memória de trabalho (coluna "pontuacao.memoria"), o modo de apresentação dos textos da tarefa de leitura (coluna "modo.apresentacao") e a pontuação em uma tarefa de leitura (coluna "pontuacao.leitura"). Na coluna "modo.apresentacao" codificou-se se o texto foi apresentado na tela de um computador em modo de hipertexto ("H") ou por meio de um dispositivo de leitura dinâmica ("S"). 
