-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 06/01/2024 às 15:22
-- Versão do servidor: 8.0.32
-- Versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `zouli_tcc`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `campos`
--

CREATE TABLE `campos` (
  `cId` int NOT NULL,
  `pId` int NOT NULL,
  `tipo` varchar(16) NOT NULL DEFAULT 'title',
  `fieldName` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `row` int NOT NULL DEFAULT '1',
  `col` int NOT NULL DEFAULT '0',
  `colsize` int NOT NULL DEFAULT '12',
  `cfg` text NOT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'se esse campo foi deletado ou não'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `campos`
--

INSERT INTO `campos` (`cId`, `pId`, `tipo`, `fieldName`, `label`, `row`, `col`, `colsize`, `cfg`, `ativo`) VALUES
(208, 17, 'title', 'AntecedentesCirurgicos', 'Antecedentes Cirúrgicos', 1, 0, 12, '{\"label\":\"Antecedentes Cir\\u00fargicos\",\"classes\":\"\",\"fieldName\":\"AntecedentesCirurgicos\"}', 1),
(209, 17, 'radio', 'Realiacaopreviadecirurgia', 'Realiação prévia de cirurgia?', 2, 0, 12, '{\"label\":\"Realia\\u00e7\\u00e3o pr\\u00e9via de cirurgia?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"unlocker\":{\"Sim\":[\"esconderAntCirurgicos\"]},\"span\":\"*\",\"fieldName\":\"Realiacaopreviadecirurgia\"}', 1),
(210, 17, 'shortText', 'Quais', 'Quais?', 3, 0, 12, '{\"label\":\"Quais?\",\"classes\":\"\",\"span\":\"*\",\"classesd\":\"esconderAntCirurgicos\",\"fieldName\":\"Quais\"}', 1),
(211, 17, 'cirurgia', 'Cirurgia', 'Cirurgia', 4, 0, 12, '{\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderAntCirurgicos\",\"label\":\"Cirurgia\",\"fieldName\":\"Cirurgia\"}', 1),
(212, 18, 'title', 'AntecedentesClinicos', 'Antecedentes Clínicos', 1, 0, 12, '{\"label\":\"Antecedentes Cl\\u00ednicos\",\"classes\":\"\",\"fieldName\":\"AntecedentesClinicos\"}', 1),
(213, 18, 'radio', 'Comorbidadeclinicadiagnosticad', 'Comorbidade clínica diagnosticada?', 2, 0, 12, '{\"label\":\"Comorbidade cl\\u00ednica diagnosticada?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconderAntClini\"]},\"fieldName\":\"Comorbidadeclinicadiagnosticad\"}', 1),
(214, 18, 'checkbox', 'Quais_1', 'Quais?', 3, 0, 12, '{\"label\":\"Quais?\",\"options\":\"Hipertens\\u00e3o Arterial Sist\\u00eamica,Diabetes Mellitus tipo 2,Diabetes Mellitus tipo 1,Dislipidemia,Hipotireoidismo,Hipertireoidismo,Epilepsia,Obesidade,Neoplasia,Discrasia sangu\\u00ednea,Outros\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderAntClini\",\"fieldName\":\"Quais_1\"}', 1),
(215, 18, 'text', 'EmcasodeNeoplasiaDiscrasiaSang', 'Em caso de Neoplasia, Discrasia Sanguínea ou Outros, especifique abaixo.', 4, 0, 12, '{\"label\":\"Em caso de Neoplasia, Discrasia Sangu\\u00ednea ou Outros, especifique abaixo.\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"999\",\"classes\":\"\",\"span\":\"\",\"classesd\":\"esconderAntClini\",\"fieldName\":\"EmcasodeNeoplasiaDiscrasiaSang\"}', 1),
(216, 18, 'shortText', 'EmcasodeObesidadeavaliarseopac', 'Em caso de Obesidade, avaliar se o paciente preenche o critério para síndrome metabólica.', 5, 0, 12, '{\"label\":\"Em caso de Obesidade, avaliar se o paciente preenche o crit\\u00e9rio para s\\u00edndrome metab\\u00f3lica.\",\"classes\":\"\",\"classesd\":\"esconderAntClini\",\"fieldName\":\"EmcasodeObesidadeavaliarseopac\"}', 1),
(217, 19, 'title', 'AntecedentesClinicos_1', 'Antecedentes Clínicos', 1, 0, 12, '{\"label\":\"Antecedentes Cl\\u00ednicos\",\"classes\":\"\",\"fieldName\":\"AntecedentesClinicos_1\"}', 1),
(218, 19, 'radio', 'Antecedentedeeventoisquemicoou', 'Antecedente de evento isquêmico ou tromboembólico?', 2, 0, 12, '{\"label\":\"Antecedente de evento isqu\\u00eamico ou tromboemb\\u00f3lico?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconderAntClini2\"]},\"fieldName\":\"Antecedentedeeventoisquemicoou\"}', 1),
(219, 19, 'checkbox', 'Quais_2', 'Quais?', 3, 0, 12, '{\"label\":\"Quais?\",\"options\":\"Infarto Agudo do Mioc\\u00e1rdio,Acidente Vascular Cerebral,Trombose Venosa Profunda,Tromboembolismo pulmonar\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderAntClini2\",\"fieldName\":\"Quais_2\"}', 1),
(220, 20, 'title', 'HistoricoPsiquiatrico', 'Histórico Psiquiátrico', 1, 0, 12, '{\"label\":\"Hist\\u00f3rico Psiqui\\u00e1trico\",\"classes\":\"\",\"fieldName\":\"HistoricoPsiquiatrico\"}', 1),
(221, 20, 'radio', 'Antecedentespsiquiatricos', 'Antecedentes psiquiátricos?', 2, 0, 12, '{\"label\":\"Antecedentes psiqui\\u00e1tricos?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconderAntPsic1\"]},\"fieldName\":\"Antecedentespsiquiatricos\"}', 1),
(222, 20, 'radio', 'Transtornosmentaisdiagnosticad', 'Transtornos mentais diagnosticados anteriormente?', 3, 0, 12, '{\"label\":\"Transtornos mentais diagnosticados anteriormente?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"classesd\":\"esconderAntPsic1\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconder2\"]},\"fieldName\":\"Transtornosmentaisdiagnosticad\"}', 1),
(223, 20, 'shortText', 'Quais_3', 'Quais?', 4, 0, 12, '{\"label\":\"Quais?\",\"classes\":\"\",\"span\":\"*\",\"classesd\":\"esconder2\",\"fieldName\":\"Quais_3\"}', 1),
(224, 20, 'diagnostico', 'Diagnosticos', 'Diagnosticos', 5, 0, 12, '{\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconder2\",\"label\":\"Diagnosticos\",\"fieldName\":\"Diagnosticos\"}', 1),
(225, 20, 'radio', 'Internacoespsiquiatricasanteri', 'Internações psiquiátricas anteriores?', 6, 0, 12, '{\"label\":\"Interna\\u00e7\\u00f5es psiqui\\u00e1tricas anteriores?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderAntPsic1\",\"unlocker\":{\"Sim\":[\"esconder3\"]},\"fieldName\":\"Internacoespsiquiatricasanteri\"}', 1),
(226, 20, 'number', 'Quantidadedeinternacoesprevias', 'Quantidade de internações prévias', 7, 0, 6, '{\"label\":\"Quantidade de interna\\u00e7\\u00f5es pr\\u00e9vias\",\"minLength\":\"1\",\"maxLength\":\"99\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconder3\",\"fieldName\":\"Quantidadedeinternacoesprevias\"}', 1),
(227, 20, 'text', 'Idadeaepocadasinternacoes', 'Idade à época das internações', 7, 0, 6, '{\"label\":\"Idade \\u00e0 \\u00e9poca das interna\\u00e7\\u00f5es\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconder3\",\"fieldName\":\"Idadeaepocadasinternacoes\"}', 1),
(228, 20, 'radio', 'Tentativasdesuicidioanteriores', 'Tentativas de suicídio anteriores?', 8, 0, 12, '{\"label\":\"Tentativas de suic\\u00eddio anteriores?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderAntPsic1\",\"unlocker\":{\"Sim\":[\"esconder4\"]},\"fieldName\":\"Tentativasdesuicidioanteriores\"}', 1),
(229, 20, 'shortText', 'Quais_4', 'Quais?', 9, 0, 12, '{\"label\":\"Quais?\",\"classes\":\"\",\"span\":\"*\",\"classesd\":\"esconder4\",\"fieldName\":\"Quais_4\"}', 1),
(230, 20, 'suicidio', 'Suicidios', 'Suicidios', 10, 0, 12, '{\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconder4\",\"label\":\"Suicidios\",\"fieldName\":\"Suicidios\"}', 1),
(231, 21, 'title', 'DadosAntropometricos', 'Dados Antropométricos', 1, 0, 12, '{\"label\":\"Dados Antropom\\u00e9tricos\",\"classes\":\"\",\"fieldName\":\"DadosAntropometricos\"}', 1),
(232, 21, 'number', 'Pesokg', 'Peso (kg)', 2, 0, 12, '{\"label\":\"Peso (kg)\",\"minLength\":\"1\",\"maxLength\":\"999\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Pesokg\"}', 1),
(233, 21, 'number', 'Alturacm', 'Altura(cm)', 3, 0, 12, '{\"label\":\"Altura(cm)\",\"minLength\":\"1\",\"maxLength\":\"999\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Alturacm\"}', 1),
(234, 21, 'number', 'CircunferenciaAbdominalcm', 'Circunferência Abdominal (cm)', 4, 0, 12, '{\"label\":\"Circunfer\\u00eancia Abdominal (cm)\",\"minLength\":\"1\",\"maxLength\":\"999\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"CircunferenciaAbdominalcm\"}', 1),
(235, 22, 'title', 'HistoricodeUso', 'Histórico de Uso', 1, 0, 12, '{\"label\":\"Hist\\u00f3rico de Uso\",\"classes\":\"\",\"fieldName\":\"HistoricodeUso\"}', 1),
(236, 22, 'checkbox', 'Quaissubstanciaspsicoativas', 'Quais substâncias psicoativas?', 2, 0, 12, '{\"label\":\"Quais subst\\u00e2ncias psicoativas?\",\"options\":\"Tabagismo,\\u00c1lcool,Outras drogas,Nenhum hist\\u00f3rico\",\"classes\":\"\",\"span\":\"*\",\"unlocker\":{\"Tabagismo\":[\"tabagismo\"],\"\\u00c1lcool\":[\"alcool\"],\"Outras drogas\":[\"outras\"]},\"fieldName\":\"Quaissubstanciaspsicoativas\"}', 1),
(237, 22, 'subtitle', 'Tabagismo', 'Tabagismo', 3, 0, 12, '{\"label\":\"Tabagismo\",\"classes\":\"\",\"classesd\":\"tabagismo\",\"fieldName\":\"Tabagismo\"}', 1),
(238, 22, 'number', 'IdadedeInicio', 'Idade de Início', 4, 0, 6, '{\"label\":\"Idade de In\\u00edcio\",\"minLength\":\"1\",\"maxLength\":\"99\",\"classes\":\"\",\"classesd\":\"tabagismo\",\"span\":\"*\",\"fieldName\":\"IdadedeInicio\"}', 1),
(239, 22, 'number', 'IdadedeTermino', 'Idade de Término', 4, 1, 6, '{\"label\":\"Idade de T\\u00e9rmino\",\"minLength\":\"1\",\"maxLength\":\"99\",\"classes\":\"\",\"classesd\":\"tabagismo\",\"span\":\"*\",\"fieldName\":\"IdadedeTermino\"}', 1),
(240, 22, 'number', 'CargaTabagicamacosporano', 'Carga Tabágica (maços por ano)', 5, 0, 12, '{\"label\":\"Carga Tab\\u00e1gica (ma\\u00e7os por ano)\",\"minLength\":\"1\",\"maxLength\":\"9999\",\"classes\":\"\",\"classesd\":\"tabagismo\",\"span\":\"*\",\"fieldName\":\"CargaTabagicamacosporano\"}', 1),
(241, 22, 'subtitle', 'Alcool', 'Álcool', 6, 0, 12, '{\"label\":\"\\u00c1lcool\",\"classes\":\"\",\"classesd\":\"alcool\",\"fieldName\":\"Alcool\"}', 1),
(242, 22, 'number', 'IdadedeInicio_1', 'Idade de Início', 7, 0, 6, '{\"label\":\"Idade de In\\u00edcio\",\"minLength\":\"1\",\"maxLength\":\"99\",\"classes\":\"\",\"classesd\":\"alcool\",\"span\":\"*\",\"fieldName\":\"IdadedeInicio_1\"}', 1),
(243, 22, 'number', 'IdadedeTermino_1', 'Idade de Término', 7, 1, 6, '{\"label\":\"Idade de T\\u00e9rmino\",\"minLength\":\"1\",\"maxLength\":\"99\",\"classes\":\"\",\"classesd\":\"alcool\",\"span\":\"*\",\"fieldName\":\"IdadedeTermino_1\"}', 1),
(244, 22, 'text', 'FrequenciadeUsounidadesporsema', 'Frequência de Uso (unidades por semana)', 8, 0, 12, '{\"label\":\"Frequ\\u00eancia de Uso (unidades por semana)\",\"placeholder\":\"\",\"minLength\":\"1\",\"maxLength\":\"64\",\"classes\":\"\",\"classesd\":\"alcool\",\"span\":\"*\",\"fieldName\":\"FrequenciadeUsounidadesporsema\"}', 1),
(245, 22, 'subtitle', 'OutrasDrogas', 'Outras Drogas', 9, 0, 12, '{\"label\":\"Outras Drogas\",\"classes\":\"\",\"classesd\":\"outras\",\"fieldName\":\"OutrasDrogas\"}', 1),
(246, 22, 'checkbox', 'Quais_5', 'Quais?', 10, 0, 12, '{\"label\":\"Quais?\",\"options\":\"Coca\\u00edna,Crack,Hero\\u00edna,Metanfetaminas,Benzodiazep\\u00ednicos,Z-Drugs,Solventes\",\"classes\":\"\",\"classesd\":\"outras\",\"span\":\"*\",\"fieldName\":\"Quais_5\"}', 1),
(247, 22, 'number', 'IdadedeInicio_2', 'Idade de Início', 11, 0, 6, '{\"label\":\"Idade de In\\u00edcio\",\"minLength\":\"1\",\"maxLength\":\"99\",\"classes\":\"\",\"classesd\":\"outras\",\"span\":\"*\",\"fieldName\":\"IdadedeInicio_2\"}', 1),
(248, 22, 'number', 'IdadedeTermino_2', 'Idade de Término', 11, 1, 6, '{\"label\":\"Idade de T\\u00e9rmino\",\"minLength\":\"1\",\"maxLength\":\"99\",\"classes\":\"\",\"classesd\":\"outras\",\"span\":\"*\",\"fieldName\":\"IdadedeTermino_2\"}', 1),
(249, 23, 'title', 'IdentificacaodoPaciente', 'Identificação do Paciente', 1, 0, 12, '{\"label\":\"Identifica\\u00e7\\u00e3o do Paciente\",\"classes\":\"titulo\",\"fieldName\":\"IdentificacaodoPaciente\"}', 1),
(250, 23, 'text', 'NomedoPaciente', 'Nome do Paciente', 2, 0, 12, '{\"label\":\"Nome do Paciente\",\"placeholder\":\"Jo\\u00e3o Silva\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"NomedoPaciente\"}', 1),
(251, 23, 'text', 'RegistroInternonHC', 'Registro Interno (n° HC)', 3, 0, 12, '{\"label\":\"Registro Interno (n\\u00b0 HC)\",\"span\":\"*\",\"placeholder\":\"12341234\",\"minLength\":\"1\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"fieldName\":\"RegistroInternonHC\"}', 1),
(252, 23, 'date', 'DatadeNascimento', 'Data de Nascimento', 4, 0, 6, '{\"label\":\"Data de Nascimento\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"DatadeNascimento\"}', 1),
(253, 23, 'select', 'Genero', 'Gênero', 4, 1, 6, '{\"label\":\"G\\u00eanero\",\"options\":\"Masculino,Feminino,N\\u00e3o Bin\\u00e1rio,Prefiro n\\u00e3o declarar\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Genero\"}', 1),
(254, 23, 'select', 'EstadoCivil', 'Estado Civil', 5, 0, 12, '{\"label\":\"Estado Civil\",\"options\":\"Casado(a),Solteiro(a),Divorciado(a),Vi\\u00favo(a),Uni\\u00e3o Est\\u00e1vel\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"EstadoCivil\"}', 1),
(255, 23, 'select', 'Estado', 'Estado', 6, 0, 4, '{\"label\":\"Estado\",\"options\":\"Acre,Alagoas,Amap\\u00e1,Amazonas,Bahia,Cear\\u00e1,Esp\\u00edrito Santo,Goi\\u00e1s,Maranh\\u00e3o,Mato Grosso,Mato Grosso do Sul,Minas Gerais,Par\\u00e1,Para\\u00edba,Paran\\u00e1,Pernambuco,Piau\\u00ed,Rio de Janeiro,Rio Grande do Norte,Rio Grande do Sul,Rond\\u00f4nia,Roraima,Santa Catarina,S\\u00e3o Paulo,Sergipe,Tocantins,Distrito Federal\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Estado\"}', 1),
(256, 23, 'text', 'Cidade', 'Cidade', 6, 1, 8, '{\"label\":\"Cidade\",\"placeholder\":\"Campinas\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Cidade\"}', 1),
(257, 24, 'title', 'IdentificacaodoPaciente_1', 'Identificação do Paciente', 1, 0, 12, '{\"label\":\"Identifica\\u00e7\\u00e3o do Paciente\",\"classes\":\"\",\"fieldName\":\"IdentificacaodoPaciente_1\"}', 1),
(258, 24, 'radio', 'Seguimentoexternoemsaudemental', 'Seguimento externo em saúde mental?', 2, 0, 12, '{\"label\":\"Seguimento externo em sa\\u00fade mental?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconderIdenti2\"]},\"fieldName\":\"Seguimentoexternoemsaudemental\"}', 1),
(259, 24, 'checkbox', 'Onde', 'Onde?', 3, 0, 12, '{\"label\":\"Onde?\",\"options\":\"CAPS,Centro de Sa\\u00fade,Particular,Ambulat\\u00f3rio de Especialidades,ambulat\\u00f3rio HC Unicamp,Resid\\u00eancia Terap\\u00eautica\",\"classes\":\"inputCriado\",\"classesd\":\"esconderIdenti2\",\"span\":\"*\",\"fieldName\":\"Onde\"}', 1),
(260, 25, 'title', 'MedicacaoClinica', 'Medicação Clínica', 1, 0, 12, '{\"label\":\"Medica\\u00e7\\u00e3o Cl\\u00ednica\",\"classes\":\"\",\"fieldName\":\"MedicacaoClinica\"}', 1),
(261, 25, 'radio', 'Medicacoesclinicasdeusocontinu', 'Medicações clínicas de uso contínuo na admissão no serviço?', 2, 0, 12, '{\"label\":\"Medica\\u00e7\\u00f5es cl\\u00ednicas de uso cont\\u00ednuo na admiss\\u00e3o no servi\\u00e7o?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconderMedCli1\"]},\"fieldName\":\"Medicacoesclinicasdeusocontinu\"}', 1),
(262, 25, 'shortText', 'Quais_6', 'Quais?', 3, 0, 12, '{\"label\":\"Quais?\",\"classes\":\"\",\"classesd\":\"esconderMedCli1\",\"fieldName\":\"Quais_6\"}', 1),
(263, 25, 'text', 'Medicacao', 'Medicação', 4, 0, 6, '{\"label\":\"Medica\\u00e7\\u00e3o\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderMedCli1\",\"fieldName\":\"Medicacao\"}', 1),
(264, 25, 'text', 'Dose', 'Dose', 4, 1, 6, '{\"label\":\"Dose\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderMedCli1\",\"fieldName\":\"Dose\"}', 1),
(265, 25, 'text', 'Indicacao', 'Indicação', 5, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"999\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderMedCli1\",\"fieldName\":\"Indicacao\"}', 1),
(266, 26, 'title', 'UsodePsicofarmacos', 'Uso de Psicofármacos', 1, 0, 12, '{\"label\":\"Uso de Psicof\\u00e1rmacos\",\"classes\":\"\",\"fieldName\":\"UsodePsicofarmacos\"}', 1),
(267, 26, 'subtitle', 'Antidepressivos', 'Antidepressivos', 2, 0, 12, '{\"label\":\"Antidepressivos\",\"classes\":\"\",\"fieldName\":\"Antidepressivos\"}', 1),
(268, 26, 'text', 'Farmaco', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Farmaco\"}', 1),
(269, 26, 'text', 'Indicacao_1', 'Indicação', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Indicacao_1\"}', 1),
(270, 26, 'text', 'Tempodeuso', 'Tempo de uso', 5, 0, 12, '{\"label\":\"Tempo de uso\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Tempodeuso\"}', 1),
(271, 26, 'text', 'Doseminima', 'Dose mínima', 6, 0, 6, '{\"label\":\"Dose m\\u00ednima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Doseminima\"}', 1),
(272, 26, 'text', 'DoseMaxima', 'Dose Máxima', 6, 1, 6, '{\"label\":\"Dose M\\u00e1xima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"DoseMaxima\"}', 1),
(273, 26, 'radio', 'Respostaterapeutica', 'Resposta terapêutica', 7, 0, 12, '{\"label\":\"Resposta terap\\u00eautica\",\"options\":\"Nula,Parcial,Total\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Respostaterapeutica\"}', 1),
(274, 26, 'text', 'Eventosadversosconhecidos', 'Eventos adversos conhecidos', 8, 0, 12, '{\"label\":\"Eventos adversos conhecidos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\",\"fieldName\":\"Eventosadversosconhecidos\"}', 1),
(275, 26, 'radio', 'Troca', 'Troca?', 9, 0, 12, '{\"label\":\"Troca?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconderPsicoAnti1\"]},\"fieldName\":\"Troca\"}', 1),
(276, 26, 'checkbox', 'Porqualrazao', 'Por qual razão?', 10, 0, 12, '{\"label\":\"Por qual raz\\u00e3o?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Desconhecida,Evento adverso grave\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderPsicoAnti1\",\"fieldName\":\"Porqualrazao\"}', 1),
(277, 26, 'text', 'EmcasodeEventoadversogravequal', 'Em caso de Evento adverso grave, qual?', 11, 0, 12, '{\"label\":\"Em caso de Evento adverso grave, qual?\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\",\"classesd\":\"esconderPsicoAnti1\",\"fieldName\":\"EmcasodeEventoadversogravequal\"}', 1),
(278, 26, 'radio', 'Setrocaondefoitrocada', 'Se troca, onde foi trocada?', 12, 0, 12, '{\"label\":\"Se troca, onde foi trocada?\",\"options\":\"CAPS,Centro de sa\\u00fade,Interna\\u00e7\\u00e3o psqui\\u00e1trica,M\\u00e9dico particular,Ambulat\\u00f3rio de especialidade,Ambulat\\u00f3rio HC Unicamp,Resid\\u00eancia terap\\u00eautica,N\\u00e3o sabe\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderPsicoAnti1\",\"fieldName\":\"Setrocaondefoitrocada\"}', 1),
(279, 40, 'title', 'UsodePsicofarmacos_1', 'Uso de Psicofármacos', 1, 0, 12, '{\"label\":\"Uso de Psicof\\u00e1rmacos\",\"classes\":\"\"}', 1),
(280, 40, 'subtitle', 'Outros', 'Outros', 2, 0, 12, '{\"label\":\"Outros\",\"classes\":\"\"}', 1),
(281, 40, 'text', 'Farmaco_1', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\"}', 1),
(282, 40, 'text', 'Indicacao_2', 'Indicação', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\"}', 1),
(283, 40, 'text', 'Tempodeuso_1', 'Tempo de uso', 5, 0, 12, '{\"label\":\"Tempo de uso\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\"}', 1),
(284, 40, 'text', 'Doseminima_1', 'Dose mínima', 6, 0, 6, '{\"label\":\"Dose m\\u00ednima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\"}', 1),
(285, 40, 'text', 'DoseMaxima_1', 'Dose Máxima', 6, 1, 6, '{\"label\":\"Dose M\\u00e1xima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\"}', 1),
(286, 40, 'radio', 'Respostaterapeutica_1', 'Resposta terapêutica', 7, 0, 12, '{\"label\":\"Resposta terap\\u00eautica\",\"options\":\"Nula,Parcial,Total\",\"classes\":\"inputCriado\",\"span\":\"*\"}', 1),
(287, 40, 'text', 'Eventosadversosconhecidos_1', 'Eventos adversos conhecidos', 8, 0, 12, '{\"label\":\"Eventos adversos conhecidos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\"}', 1),
(288, 40, 'radio', 'Troca_1', 'Troca?', 9, 0, 12, '{\"label\":\"Troca?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconderPsicoOutros\"]}}', 1),
(289, 40, 'checkbox', 'Porqualrazao_1', 'Por qual razão?', 10, 0, 12, '{\"label\":\"Por qual raz\\u00e3o?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Desconhecida,Evento adverso grave\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderPsicoOutros\"}', 1),
(290, 40, 'text', 'EmcasodeEventoadversogravequal_1', 'Em caso de Evento adverso grave, qual?', 11, 0, 12, '{\"label\":\"Em caso de Evento adverso grave, qual?\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\",\"classesd\":\"esconderPsicoOutros\"}', 1),
(291, 40, 'radio', 'Setrocaondefoitrocada_1', 'Se troca, onde foi trocada?', 12, 0, 12, '{\"label\":\"Se troca, onde foi trocada?\",\"options\":\"CAPS,Centro de sa\\u00fade,Interna\\u00e7\\u00e3o psqui\\u00e1trica,M\\u00e9dico particular,Ambulat\\u00f3rio de especialidade,Ambulat\\u00f3rio HC Unicamp,Resid\\u00eancia terap\\u00eautica,N\\u00e3o sabe\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderPsicoOutros\"}', 1),
(292, 27, 'title', 'UsodePsicofarmacos_1', 'Uso de Psicofármacos', 1, 0, 12, '{\"label\":\"Uso de Psicof\\u00e1rmacos\",\"classes\":\"\",\"fieldName\":\"UsodePsicofarmacos_1\"}', 1),
(293, 27, 'radio', 'Psicofarmacosdeusocontinuonaad', 'Psicofármacos de uso prévio à admissão do serviço', 2, 0, 12, '{\"label\":\"Psicof\\u00e1rmacos de uso pr\\u00e9vio \\u00e0 admiss\\u00e3o do servi\\u00e7o\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconderPsico\"]},\"fieldName\":\"Psicofarmacosdeusocontinuonaad\"}', 1),
(294, 27, 'checkbox', 'Sesimquais', 'Se sim, quais?', 3, 0, 12, '{\"label\":\"Se sim, quais?\",\"options\":\"Antidepressivos,Antipsic\\u00f3ticos,Anticonvulsivantes ou Carbonato de Lítio,Benzodiazep\\u00ednicos,Z-drugs,Psicoestimulantes,Outros\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderPsico\",\"unlockerPagina\":{\"Antidepressivos\":[\"psicofarmacoAntidepressivo.json\"],\"Antipsic\\u00f3ticos\":[\"psicofarmacosAntipsicoticos.json\"],\"Anticonvulsivantes ou Carbonato de Lítio\":[\"psicofarmacosAnticonvulsivante.json\"],\"Benzodiazep\\u00ednicos\":[\"psicofarmacosBenzodiazepinicos.json\"],\"Z-drugs\":[\"psicofarmacosZDrugs.json\"],\"Psicoestimulantes\":[\"psicofarmacosPsicoestimulante.json\"],\"Outros\":[\"psicofarmacoOutros.json\"]},\"fieldName\":\"Sesimquais\"}', 1),
(295, 28, 'title', 'UsodePsicofarmacos_2', 'Uso de Psicofármacos', 1, 0, 12, '{\"label\":\"Uso de Psicof\\u00e1rmacos\",\"classes\":\"\",\"fieldName\":\"UsodePsicofarmacos_2\"}', 1),
(296, 28, 'subtitle', 'Anticonvulsivantes', 'Anticonvulsivantes ou Carbonato de Lítio', 2, 0, 12, '{\"label\":\"Anticonvulsivantes ou Carbonato de L\\u00edtio\",\"classes\":\"\",\"fieldName\":\"Anticonvulsivantes\"}', 1),
(297, 28, 'text', 'Farmaco_1', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Farmaco_1\"}', 1),
(298, 28, 'text', 'Indicacao_2', 'Indicação', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Indicacao_2\"}', 1),
(299, 28, 'text', 'Tempodeuso_1', 'Tempo de uso', 5, 0, 12, '{\"label\":\"Tempo de uso\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Tempodeuso_1\"}', 1),
(300, 28, 'text', 'Doseminima_1', 'Dose mínima', 6, 0, 6, '{\"label\":\"Dose m\\u00ednima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Doseminima_1\"}', 1),
(301, 28, 'text', 'DoseMaxima_1', 'Dose Máxima', 6, 1, 6, '{\"label\":\"Dose M\\u00e1xima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"DoseMaxima_1\"}', 1),
(302, 28, 'radio', 'Respostaterapeutica_1', 'Resposta terapêutica', 7, 0, 12, '{\"label\":\"Resposta terap\\u00eautica\",\"options\":\"Nula,Parcial,Total\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Respostaterapeutica_1\"}', 1),
(303, 28, 'text', 'Eventosadversosconhecidos_1', 'Eventos adversos conhecidos', 8, 0, 12, '{\"label\":\"Eventos adversos conhecidos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\",\"fieldName\":\"Eventosadversosconhecidos_1\"}', 1),
(304, 28, 'radio', 'Troca_1', 'Troca?', 9, 0, 12, '{\"label\":\"Troca?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconderPsicoAnti2\"]},\"fieldName\":\"Troca_1\"}', 1),
(305, 28, 'checkbox', 'Porqualrazao_1', 'Por qual razão?', 10, 0, 12, '{\"label\":\"Por qual raz\\u00e3o?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Desconhecida,Evento adverso grave\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderPsicoAnti2\",\"fieldName\":\"Porqualrazao_1\"}', 1),
(306, 28, 'text', 'EmcasodeEventoadversogravequal_1', 'Em caso de Evento adverso grave, qual?', 11, 0, 12, '{\"label\":\"Em caso de Evento adverso grave, qual?\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\",\"classesd\":\"esconderPsicoAnti2\",\"fieldName\":\"EmcasodeEventoadversogravequal_1\"}', 1),
(307, 28, 'radio', 'Setrocaondefoitrocada_1', 'Se troca, onde foi trocada?', 12, 0, 12, '{\"label\":\"Se troca, onde foi trocada?\",\"options\":\"CAPS,Centro de sa\\u00fade,Interna\\u00e7\\u00e3o psqui\\u00e1trica,M\\u00e9dico particular,Ambulat\\u00f3rio de especialidade,Ambulat\\u00f3rio HC Unicamp,Resid\\u00eancia terap\\u00eautica,N\\u00e3o sabe\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderPsicoAnti2\",\"fieldName\":\"Setrocaondefoitrocada_1\"}', 1),
(308, 29, 'title', 'UsodePsicofarmacos_3', 'Uso de Psicofármacos', 1, 0, 12, '{\"label\":\"Uso de Psicof\\u00e1rmacos\",\"classes\":\"\",\"fieldName\":\"UsodePsicofarmacos_3\"}', 1),
(309, 29, 'subtitle', 'Antipsicoticos', 'Antipsicóticos', 2, 0, 12, '{\"label\":\"Antipsic\\u00f3ticos\",\"classes\":\"\",\"fieldName\":\"Antipsicoticos\"}', 1),
(310, 29, 'text', 'Farmaco_2', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Farmaco_2\"}', 1),
(311, 29, 'text', 'Indicacao_3', 'Indicação', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Indicacao_3\"}', 1),
(312, 29, 'text', 'Tempodeuso_2', 'Tempo de uso', 5, 0, 12, '{\"label\":\"Tempo de uso\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Tempodeuso_2\"}', 1),
(313, 29, 'text', 'Doseminima_2', 'Dose mínima', 6, 0, 6, '{\"label\":\"Dose m\\u00ednima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Doseminima_2\"}', 1),
(314, 29, 'text', 'DoseMaxima_2', 'Dose Máxima', 6, 1, 6, '{\"label\":\"Dose M\\u00e1xima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"DoseMaxima_2\"}', 1),
(315, 29, 'radio', 'Respostaterapeutica_2', 'Resposta terapêutica', 7, 0, 12, '{\"label\":\"Resposta terap\\u00eautica\",\"options\":\"Nula,Parcial,Total\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Respostaterapeutica_2\"}', 1),
(316, 29, 'text', 'Eventosadversosconhecidos_2', 'Eventos adversos conhecidos', 8, 0, 12, '{\"label\":\"Eventos adversos conhecidos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\",\"fieldName\":\"Eventosadversosconhecidos_2\"}', 1),
(317, 29, 'radio', 'Troca_2', 'Troca?', 9, 0, 12, '{\"label\":\"Troca?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconderPsicoAnti3\"]},\"fieldName\":\"Troca_2\"}', 1),
(318, 29, 'checkbox', 'Porqualrazao_2', 'Por qual razão?', 10, 0, 12, '{\"label\":\"Por qual raz\\u00e3o?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Desconhecida,Evento adverso grave\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderPsicoAnti3\",\"fieldName\":\"Porqualrazao_2\"}', 1),
(319, 29, 'text', 'EmcasodeEventoadversogravequal_2', 'Em caso de Evento adverso grave, qual?', 11, 0, 12, '{\"label\":\"Em caso de Evento adverso grave, qual?\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\",\"classesd\":\"esconderPsicoAnti3\",\"fieldName\":\"EmcasodeEventoadversogravequal_2\"}', 1),
(320, 29, 'radio', 'Setrocaondefoitrocada_2', 'Se troca, onde foi trocada?', 12, 0, 12, '{\"label\":\"Se troca, onde foi trocada?\",\"options\":\"CAPS,Centro de sa\\u00fade,Interna\\u00e7\\u00e3o psqui\\u00e1trica,M\\u00e9dico particular,Ambulat\\u00f3rio de especialidade,Ambulat\\u00f3rio HC Unicamp,Resid\\u00eancia terap\\u00eautica,N\\u00e3o sabe\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderPsicoAnti3\",\"fieldName\":\"Setrocaondefoitrocada_2\"}', 1),
(321, 30, 'title', 'UsodePsicofarmacos_4', 'Uso de Psicofármacos', 1, 0, 12, '{\"label\":\"Uso de Psicof\\u00e1rmacos\",\"classes\":\"\",\"fieldName\":\"UsodePsicofarmacos_4\"}', 1),
(322, 30, 'subtitle', 'Benzodiazepinicos', 'Benzodiazepínicos ', 2, 0, 12, '{\"label\":\"Benzodiazep\\u00ednicos \",\"classes\":\"\",\"fieldName\":\"Benzodiazepinicos\"}', 1),
(323, 30, 'text', 'Farmaco_3', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Farmaco_3\"}', 1),
(324, 30, 'text', 'Indicacao_4', 'Indicação', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Indicacao_4\"}', 1),
(325, 30, 'text', 'Tempodeuso_3', 'Tempo de uso', 5, 0, 12, '{\"label\":\"Tempo de uso\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Tempodeuso_3\"}', 1),
(326, 30, 'text', 'Doseminima_3', 'Dose mínima', 6, 0, 6, '{\"label\":\"Dose m\\u00ednima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Doseminima_3\"}', 1),
(327, 30, 'text', 'DoseMaxima_3', 'Dose Máxima', 6, 1, 6, '{\"label\":\"Dose M\\u00e1xima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"DoseMaxima_3\"}', 1),
(328, 30, 'radio', 'Respostaterapeutica_3', 'Resposta terapêutica', 7, 0, 12, '{\"label\":\"Resposta terap\\u00eautica\",\"options\":\"Nula,Parcial,Total\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Respostaterapeutica_3\"}', 1),
(329, 30, 'text', 'Eventosadversosconhecidos_3', 'Eventos adversos conhecidos', 8, 0, 12, '{\"label\":\"Eventos adversos conhecidos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\",\"fieldName\":\"Eventosadversosconhecidos_3\"}', 1),
(330, 30, 'radio', 'Troca_3', 'Troca?', 9, 0, 12, '{\"label\":\"Troca?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconderPsicoBenzo1\"]},\"fieldName\":\"Troca_3\"}', 1),
(331, 30, 'checkbox', 'Porqualrazao_3', 'Por qual razão?', 10, 0, 12, '{\"label\":\"Por qual raz\\u00e3o?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Desconhecida,Evento adverso grave\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderPsicoBenzo1\",\"fieldName\":\"Porqualrazao_3\"}', 1),
(332, 30, 'text', 'EmcasodeEventoadversogravequal_3', 'Em caso de Evento adverso grave, qual?', 11, 0, 12, '{\"label\":\"Em caso de Evento adverso grave, qual?\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\",\"classesd\":\"esconderPsicoBenzo1\",\"fieldName\":\"EmcasodeEventoadversogravequal_3\"}', 1),
(333, 30, 'radio', 'Setrocaondefoitrocada_3', 'Se troca, onde foi trocada?', 12, 0, 12, '{\"label\":\"Se troca, onde foi trocada?\",\"options\":\"CAPS,Centro de sa\\u00fade,Interna\\u00e7\\u00e3o psqui\\u00e1trica,M\\u00e9dico particular,Ambulat\\u00f3rio de especialidade,Ambulat\\u00f3rio HC Unicamp,Resid\\u00eancia terap\\u00eautica,N\\u00e3o sabe\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderPsicoBenzo1\",\"fieldName\":\"Setrocaondefoitrocada_3\"}', 1),
(334, 31, 'title', 'UsodePsicofarmacos_5', 'Uso de Psicofármacos', 1, 0, 12, '{\"label\":\"Uso de Psicof\\u00e1rmacos\",\"classes\":\"\",\"fieldName\":\"UsodePsicofarmacos_5\"}', 1),
(335, 31, 'subtitle', 'Psicoestimulantes', 'Psicoestimulantes ', 2, 0, 12, '{\"label\":\"Psicoestimulantes \",\"classes\":\"\",\"fieldName\":\"Psicoestimulantes\"}', 1),
(336, 31, 'text', 'Farmaco_4', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Farmaco_4\"}', 1),
(337, 31, 'text', 'Indicacao_5', 'Indicação', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Indicacao_5\"}', 1),
(338, 31, 'text', 'Tempodeuso_4', 'Tempo de uso', 5, 0, 12, '{\"label\":\"Tempo de uso\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Tempodeuso_4\"}', 1),
(339, 31, 'text', 'Doseminima_4', 'Dose mínima', 6, 0, 6, '{\"label\":\"Dose m\\u00ednima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Doseminima_4\"}', 1),
(340, 31, 'text', 'DoseMaxima_4', 'Dose Máxima', 6, 1, 6, '{\"label\":\"Dose M\\u00e1xima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"DoseMaxima_4\"}', 1),
(341, 31, 'radio', 'Respostaterapeutica_4', 'Resposta terapêutica', 7, 0, 12, '{\"label\":\"Resposta terap\\u00eautica\",\"options\":\"Nula,Parcial,Total\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Respostaterapeutica_4\"}', 1),
(342, 31, 'text', 'Eventosadversosconhecidos_4', 'Eventos adversos conhecidos', 8, 0, 12, '{\"label\":\"Eventos adversos conhecidos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\",\"fieldName\":\"Eventosadversosconhecidos_4\"}', 1),
(343, 31, 'radio', 'Troca_4', 'Troca?', 9, 0, 12, '{\"label\":\"Troca?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconderPsicoEst1\"]},\"fieldName\":\"Troca_4\"}', 1),
(344, 31, 'checkbox', 'Porqualrazao_4', 'Por qual razão?', 10, 0, 12, '{\"label\":\"Por qual raz\\u00e3o?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Desconhecida,Evento adverso grave\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderPsicoEst1\",\"fieldName\":\"Porqualrazao_4\"}', 1),
(345, 31, 'text', 'EmcasodeEventoadversogravequal_4', 'Em caso de Evento adverso grave, qual?', 11, 0, 12, '{\"label\":\"Em caso de Evento adverso grave, qual?\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\",\"classesd\":\"esconderPsicoEst1\",\"fieldName\":\"EmcasodeEventoadversogravequal_4\"}', 1),
(346, 31, 'radio', 'Setrocaondefoitrocada_4', 'Se troca, onde foi trocada?', 12, 0, 12, '{\"label\":\"Se troca, onde foi trocada?\",\"options\":\"CAPS,Centro de sa\\u00fade,Interna\\u00e7\\u00e3o psqui\\u00e1trica,M\\u00e9dico particular,Ambulat\\u00f3rio de especialidade,Ambulat\\u00f3rio HC Unicamp,Resid\\u00eancia terap\\u00eautica,N\\u00e3o sabe\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconderPsicoEst1\",\"fieldName\":\"Setrocaondefoitrocada_4\"}', 1),
(347, 32, 'title', 'UsodePsicofarmacos_6', 'Uso de Psicofármacos', 1, 0, 12, '{\"label\":\"Uso de Psicof\\u00e1rmacos\",\"classes\":\"\",\"fieldName\":\"UsodePsicofarmacos_6\"}', 1),
(348, 32, 'subtitle', 'Zdrugs', 'Z-drugs ', 2, 0, 12, '{\"label\":\"Z-drugs \",\"classes\":\"\",\"fieldName\":\"Zdrugs\"}', 1),
(349, 32, 'text', 'Farmaco_5', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Farmaco_5\"}', 1),
(350, 32, 'text', 'Indicacao_6', 'Indicação', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Indicacao_6\"}', 1),
(351, 32, 'text', 'Tempodeuso_5', 'Tempo de uso', 5, 0, 12, '{\"label\":\"Tempo de uso\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Tempodeuso_5\"}', 1),
(352, 32, 'text', 'Doseminima_5', 'Dose mínima', 6, 0, 6, '{\"label\":\"Dose m\\u00ednima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Doseminima_5\"}', 1),
(353, 32, 'text', 'DoseMaxima_5', 'Dose Máxima', 6, 1, 6, '{\"label\":\"Dose M\\u00e1xima\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"DoseMaxima_5\"}', 1),
(354, 32, 'radio', 'Respostaterapeutica_5', 'Resposta terapêutica', 7, 0, 12, '{\"label\":\"Resposta terap\\u00eautica\",\"options\":\"Nula,Parcial,Total\",\"classes\":\"inputCriado\",\"span\":\"*\",\"fieldName\":\"Respostaterapeutica_5\"}', 1),
(355, 32, 'text', 'Eventosadversosconhecidos_5', 'Eventos adversos conhecidos', 8, 0, 12, '{\"label\":\"Eventos adversos conhecidos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\",\"fieldName\":\"Eventosadversosconhecidos_5\"}', 1),
(356, 32, 'radio', 'Troca_5', 'Troca?', 9, 0, 12, '{\"label\":\"Troca?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"inputCriado\",\"span\":\"*\",\"unlocker\":{\"Sim\":[\"esconder1\"]},\"fieldName\":\"Troca_5\"}', 1),
(357, 32, 'checkbox', 'Porqualrazao_5', 'Por qual razão?', 10, 0, 12, '{\"label\":\"Por qual raz\\u00e3o?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Desconhecida,Evento adverso grave\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconder1\",\"fieldName\":\"Porqualrazao_5\"}', 1),
(358, 32, 'text', 'EmcasodeEventoadversogravequal_5', 'Em caso de Evento adverso grave, qual?', 11, 0, 12, '{\"label\":\"Em caso de Evento adverso grave, qual?\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\",\"span\":\"\",\"classesd\":\"esconder1\",\"fieldName\":\"EmcasodeEventoadversogravequal_5\"}', 1),
(359, 32, 'radio', 'Setrocaondefoitrocada_5', 'Se troca, onde foi trocada?', 12, 0, 12, '{\"label\":\"Se troca, onde foi trocada?\",\"options\":\"CAPS,Centro de sa\\u00fade,Interna\\u00e7\\u00e3o psqui\\u00e1trica,M\\u00e9dico particular,Ambulat\\u00f3rio de especialidade,Ambulat\\u00f3rio HC Unicamp,Resid\\u00eancia terap\\u00eautica,N\\u00e3o sabe\",\"classes\":\"inputCriado\",\"span\":\"*\",\"classesd\":\"esconder1\",\"fieldName\":\"Setrocaondefoitrocada_5\"}', 1),
(360, 33, 'title', 'TratamentoFarmacologico', 'Tratamento Farmacológico', 1, 0, 12, '{\"label\":\"Tratamento Farmacol\\u00f3gico\",\"classes\":\"\"}', 1),
(361, 33, 'subtitle', 'AnticonvulsivanteouCarbonatode', 'Anticonvulsivante ou Carbonato de Lítio', 2, 0, 12, '{\"label\":\"Anticonvulsivante ou Carbonato de L\\u00edtio\",\"classes\":\"\"}', 1),
(362, 33, 'text', 'Farmaco_6', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(363, 33, 'text', 'Indicacaoterapeutica', 'Indicação terapêutica', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o terap\\u00eautica\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(364, 33, 'text', 'Doseinicial', 'Dose inicial', 5, 0, 12, '{\"label\":\"Dose inicial\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(365, 33, 'text', 'Doseintermediaria', 'Dose intermediária', 6, 0, 12, '{\"label\":\"Dose intermedi\\u00e1ria\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(366, 33, 'text', 'Dosefinal', 'Dose final', 7, 0, 12, '{\"label\":\"Dose final\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"59\",\"classes\":\"\"}', 1),
(367, 33, 'text', 'Eventosadversos', 'Eventos adversos', 8, 0, 12, '{\"label\":\"Eventos adversos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"999\",\"classes\":\"\"}', 1),
(368, 33, 'radio', 'Foiindicadatrocademedicacaopor', 'Foi indicada troca de medicação por outra de mesma classe?', 9, 0, 12, '{\"label\":\"Foi indicada troca de medica\\u00e7\\u00e3o por outra de mesma classe?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"\",\"unlocker\":{\"Sim\":[\"esconderTrocaConvulsivante\"]}}', 1),
(369, 33, 'checkbox', 'Porqualmotivo', 'Por qual motivo?', 10, 0, 12, '{\"label\":\"Por qual motivo?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Evento adverso grave\",\"classes\":\"\",\"classesd\":\"esconderTrocaConvulsivante\"}', 1),
(370, 33, 'text', 'EmcasodeEventoAdversoGravedesc', 'Em caso de Evento Adverso Grave, descreva abaixo', 12, 0, 12, '{\"label\":\"Em caso de Evento Adverso Grave, descreva abaixo\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(371, 34, 'title', 'TratamentoFarmacologico_1', 'Tratamento Farmacológico', 1, 0, 12, '{\"label\":\"Tratamento Farmacol\\u00f3gico\",\"classes\":\"\"}', 1),
(372, 34, 'subtitle', 'Antidepressivo', 'Antidepressivo', 2, 0, 12, '{\"label\":\"Antidepressivo\",\"classes\":\"\"}', 1),
(373, 34, 'text', 'Farmaco_7', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(374, 34, 'text', 'Indicacaoterapeutica_1', 'Indicação terapêutica', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o terap\\u00eautica\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(375, 34, 'text', 'Doseinicial_1', 'Dose inicial', 5, 0, 12, '{\"label\":\"Dose inicial\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(376, 34, 'text', 'Doseintermediaria_1', 'Dose intermediária', 6, 0, 12, '{\"label\":\"Dose intermedi\\u00e1ria\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(377, 34, 'text', 'Dosefinal_1', 'Dose final', 7, 0, 12, '{\"label\":\"Dose final\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"59\",\"classes\":\"\"}', 1),
(378, 34, 'text', 'Eventosadversos_1', 'Eventos adversos', 8, 0, 12, '{\"label\":\"Eventos adversos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"999\",\"classes\":\"\"}', 1),
(379, 34, 'radio', 'Foiindicadatrocademedicacaopor_1', 'Foi indicada troca de medicação por outra de mesma classe?', 9, 0, 12, '{\"label\":\"Foi indicada troca de medica\\u00e7\\u00e3o por outra de mesma classe?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"\",\"unlocker\":{\"Sim\":[\"esconderTrocaAntidepressivo\"]}}', 1),
(380, 34, 'checkbox', 'Porqualmotivo_1', 'Por qual motivo?', 10, 0, 12, '{\"label\":\"Por qual motivo?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Evento adverso grave\",\"classes\":\"\",\"classesd\":\"esconderTrocaAntidepressivo\"}', 1),
(381, 34, 'text', 'EmcasodeEventoAdversoGravedesc_1', 'Em caso de Evento Adverso Grave, descreva abaixo', 12, 0, 12, '{\"label\":\"Em caso de Evento Adverso Grave, descreva abaixo\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(382, 35, 'title', 'TratamentoFarmacologico_2', 'Tratamento Farmacológico', 1, 0, 12, '{\"label\":\"Tratamento Farmacol\\u00f3gico\",\"classes\":\"\"}', 1),
(383, 35, 'subtitle', 'Antipsicotico', 'Antipsicótico', 2, 0, 12, '{\"label\":\"Antipsic\\u00f3tico\",\"classes\":\"\"}', 1),
(384, 35, 'text', 'Farmaco_8', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(385, 35, 'text', 'Indicacaoterapeutica_2', 'Indicação terapêutica', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o terap\\u00eautica\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(386, 35, 'text', 'Doseinicial_2', 'Dose inicial', 5, 0, 12, '{\"label\":\"Dose inicial\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(387, 35, 'text', 'Doseintermediaria_2', 'Dose intermediária', 6, 0, 12, '{\"label\":\"Dose intermedi\\u00e1ria\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(388, 35, 'text', 'Dosefinal_2', 'Dose final', 7, 0, 12, '{\"label\":\"Dose final\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"59\",\"classes\":\"\"}', 1),
(389, 35, 'text', 'Eventosadversos_2', 'Eventos adversos', 8, 0, 12, '{\"label\":\"Eventos adversos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"999\",\"classes\":\"\"}', 1),
(390, 35, 'radio', 'Foiindicadatrocademedicacaopor_2', 'Foi indicada troca de medicação por outra de mesma classe?', 9, 0, 12, '{\"label\":\"Foi indicada troca de medica\\u00e7\\u00e3o por outra de mesma classe?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"\",\"unlocker\":{\"Sim\":[\"esconderTrocaAntipsicotico\"]}}', 1),
(391, 35, 'checkbox', 'Porqualmotivo_2', 'Por qual motivo?', 10, 0, 12, '{\"label\":\"Por qual motivo?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Evento adverso grave\",\"classes\":\"\",\"classesd\":\"esconderTrocaAntipsicotico\"}', 1),
(392, 35, 'text', 'EmcasodeEventoAdversoGravedesc_2', 'Em caso de Evento Adverso Grave, descreva abaixo', 12, 0, 12, '{\"label\":\"Em caso de Evento Adverso Grave, descreva abaixo\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(393, 36, 'title', 'TratamentoFarmacologico_3', 'Tratamento Farmacológico', 1, 0, 12, '{\"label\":\"Tratamento Farmacol\\u00f3gico\",\"classes\":\"\"}', 1),
(394, 36, 'subtitle', 'Benzodiazepinico', 'Benzodiazepínico', 2, 0, 12, '{\"label\":\"Benzodiazep\\u00ednico\",\"classes\":\"\"}', 1),
(395, 36, 'text', 'Farmaco_9', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(396, 36, 'text', 'Indicacaoterapeutica_3', 'Indicação terapêutica', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o terap\\u00eautica\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(397, 36, 'text', 'Doseinicial_3', 'Dose inicial', 5, 0, 12, '{\"label\":\"Dose inicial\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(398, 36, 'text', 'Doseintermediaria_3', 'Dose intermediária', 6, 0, 12, '{\"label\":\"Dose intermedi\\u00e1ria\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(399, 36, 'text', 'Dosefinal_3', 'Dose final', 7, 0, 12, '{\"label\":\"Dose final\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"59\",\"classes\":\"\"}', 1),
(400, 36, 'text', 'Eventosadversos_3', 'Eventos adversos', 8, 0, 12, '{\"label\":\"Eventos adversos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"999\",\"classes\":\"\"}', 1),
(401, 36, 'radio', 'Foiindicadatrocademedicacaopor_3', 'Foi indicada troca de medicação por outra de mesma classe?', 9, 0, 12, '{\"label\":\"Foi indicada troca de medica\\u00e7\\u00e3o por outra de mesma classe?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"\",\"unlocker\":{\"Sim\":[\"esconderTrocaBenzodiazepinico\"]}}', 1),
(402, 36, 'checkbox', 'Porqualmotivo_3', 'Por qual motivo?', 10, 0, 12, '{\"label\":\"Por qual motivo?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Evento adverso grave\",\"classes\":\"\",\"classesd\":\"esconderTrocaBenzodiazepinico\"}', 1),
(403, 36, 'text', 'EmcasodeEventoAdversoGravedesc_3', 'Em caso de Evento Adverso Grave, descreva abaixo', 12, 0, 12, '{\"label\":\"Em caso de Evento Adverso Grave, descreva abaixo\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(404, 41, 'title', 'TratamentoFarmacologico_4', 'Tratamento Farmacológico', 1, 0, 12, '{\"label\":\"Tratamento Farmacol\\u00f3gico\",\"classes\":\"\"}', 1),
(405, 41, 'subtitle', 'Outros_1', 'Outros', 2, 0, 12, '{\"label\":\"Outros\",\"classes\":\"\"}', 1),
(406, 41, 'text', 'Farmaco_10', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1);
INSERT INTO `campos` (`cId`, `pId`, `tipo`, `fieldName`, `label`, `row`, `col`, `colsize`, `cfg`, `ativo`) VALUES
(407, 41, 'text', 'Indicacaoterapeutica_4', 'Indicação terapêutica', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o terap\\u00eautica\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(408, 41, 'text', 'Doseinicial_4', 'Dose inicial', 5, 0, 12, '{\"label\":\"Dose inicial\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(409, 41, 'text', 'Doseintermediaria_4', 'Dose intermediária', 6, 0, 12, '{\"label\":\"Dose intermedi\\u00e1ria\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(410, 41, 'text', 'Dosefinal_4', 'Dose final', 7, 0, 12, '{\"label\":\"Dose final\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"59\",\"classes\":\"\"}', 1),
(411, 41, 'text', 'Eventosadversos_4', 'Eventos adversos', 8, 0, 12, '{\"label\":\"Eventos adversos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"999\",\"classes\":\"\"}', 1),
(412, 41, 'radio', 'Foiindicadatrocademedicacaopor_4', 'Foi indicada troca de medicação por outra de mesma classe?', 9, 0, 12, '{\"label\":\"Foi indicada troca de medica\\u00e7\\u00e3o por outra de mesma classe?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"\",\"unlocker\":{\"Sim\":[\"esconderTrocaOutros\"]}}', 1),
(413, 41, 'checkbox', 'Porqualmotivo_4', 'Por qual motivo?', 10, 0, 12, '{\"label\":\"Por qual motivo?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Evento adverso grave\",\"classes\":\"\",\"classesd\":\"esconderTrocaOutros\"}', 1),
(414, 41, 'text', 'EmcasodeEventoAdversoGravedesc_4', 'Em caso de Evento Adverso Grave, descreva abaixo', 12, 0, 12, '{\"label\":\"Em caso de Evento Adverso Grave, descreva abaixo\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(415, 37, 'title', 'TratamentoFarmacologico_5', 'Tratamento Farmacológico', 1, 0, 12, '{\"label\":\"Tratamento Farmacol\\u00f3gico\",\"classes\":\"\"}', 1),
(416, 37, 'subtitle', 'Psicoestimulante', 'Psicoestimulante', 2, 0, 12, '{\"label\":\"Psicoestimulante\",\"classes\":\"\"}', 1),
(417, 37, 'text', 'Farmaco_11', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(418, 37, 'text', 'Indicacaoterapeutica_5', 'Indicação terapêutica', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o terap\\u00eautica\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(419, 37, 'text', 'Doseinicial_5', 'Dose inicial', 5, 0, 12, '{\"label\":\"Dose inicial\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(420, 37, 'text', 'Doseintermediaria_5', 'Dose intermediária', 6, 0, 12, '{\"label\":\"Dose intermedi\\u00e1ria\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(421, 37, 'text', 'Dosefinal_5', 'Dose final', 7, 0, 12, '{\"label\":\"Dose final\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"59\",\"classes\":\"\"}', 1),
(422, 37, 'text', 'Eventosadversos_5', 'Eventos adversos', 8, 0, 12, '{\"label\":\"Eventos adversos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"999\",\"classes\":\"\"}', 1),
(423, 37, 'radio', 'Foiindicadatrocademedicacaopor_5', 'Foi indicada troca de medicação por outra de mesma classe?', 9, 0, 12, '{\"label\":\"Foi indicada troca de medica\\u00e7\\u00e3o por outra de mesma classe?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"\",\"unlocker\":{\"Sim\":[\"esconderTrocaPsicoestimulante\"]}}', 1),
(424, 37, 'checkbox', 'Porqualmotivo_5', 'Por qual motivo?', 10, 0, 12, '{\"label\":\"Por qual motivo?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Evento adverso grave\",\"classes\":\"\",\"classesd\":\"esconderTrocaPsicoestimulante\"}', 1),
(425, 37, 'text', 'EmcasodeEventoAdversoGravedesc_5', 'Em caso de Evento Adverso Grave, descreva abaixo', 12, 0, 12, '{\"label\":\"Em caso de Evento Adverso Grave, descreva abaixo\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(426, 38, 'title', 'TratamentoFarmacologicodurante', 'Tratamento Farmacológico durante a Internação', 1, 0, 12, '{\"label\":\"Tratamento Farmacol\\u00f3gico durante a Interna\\u00e7\\u00e3o\",\"classes\":\"\"}', 1),
(427, 38, 'checkbox', 'Quaisfarmacosopacientefazuso', 'Quais fármacos o paciente faz uso?', 2, 0, 12, '{\"label\":\"Quais f\\u00e1rmacos o paciente faz uso?\",\"options\":\"Antidepressivo,Antipsic\\u00f3tico,Anticonvulsivante ou Carbonato de Lítio,Benzodiazep\\u00ednico,Z-drug,Psicoestimulante,Outros\",\"classes\":\"\",\"unlockerPagina\":{\"Antidepressivo\":[\"antidepressivo.json\"],\"Antipsic\\u00f3tico\":[\"antipsicotico.json\"],\"Anticonvulsivante ou Carbonato de Lítio\":[\"anticonvulsivante.json\"],\"Benzodiazep\\u00ednico\":[\"benzodiazepinico.json\"],\"Z-drug\":[\"zdrug.json\"],\"Psicoestimulante\":[\"psicoestimulante.json\"],\"Outros\":[\"outros.json\"]}}', 1),
(428, 39, 'title', 'TratamentoFarmacologico_6', 'Tratamento Farmacológico', 1, 0, 12, '{\"label\":\"Tratamento Farmacol\\u00f3gico\",\"classes\":\"\"}', 1),
(429, 39, 'subtitle', 'ZDrugs_1', 'Z-Drugs', 2, 0, 12, '{\"label\":\"Z-Drugs\",\"classes\":\"\"}', 1),
(430, 39, 'text', 'Farmaco_12', 'Fármaco', 3, 0, 12, '{\"label\":\"F\\u00e1rmaco\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(431, 39, 'text', 'Indicacaoterapeutica_6', 'Indicação terapêutica', 4, 0, 12, '{\"label\":\"Indica\\u00e7\\u00e3o terap\\u00eautica\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(432, 39, 'text', 'Doseinicial_6', 'Dose inicial', 5, 0, 12, '{\"label\":\"Dose inicial\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(433, 39, 'text', 'Doseintermediaria_6', 'Dose intermediária', 6, 0, 12, '{\"label\":\"Dose intermedi\\u00e1ria\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"64\",\"classes\":\"\"}', 1),
(434, 39, 'text', 'Dosefinal_6', 'Dose final', 7, 0, 12, '{\"label\":\"Dose final\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"59\",\"classes\":\"\"}', 1),
(435, 39, 'text', 'Eventosadversos_6', 'Eventos adversos', 8, 0, 12, '{\"label\":\"Eventos adversos\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"999\",\"classes\":\"\"}', 1),
(436, 39, 'radio', 'Foiindicadatrocademedicacaopor_6', 'Foi indicada troca de medicação por outra de mesma classe?', 9, 0, 12, '{\"label\":\"Foi indicada troca de medica\\u00e7\\u00e3o por outra de mesma classe?\",\"options\":\"Sim,N\\u00e3o\",\"classes\":\"\",\"unlocker\":{\"Sim\":[\"esconderTrocaZdrug\"]}}', 1),
(437, 39, 'checkbox', 'Porqualmotivo_6', 'Por qual motivo?', 10, 0, 12, '{\"label\":\"Por qual motivo?\",\"options\":\"Falha terap\\u00eautica,Resposta parcial,Mudan\\u00e7a de hip\\u00f3tese diagn\\u00f3stica,Evento adverso grave\",\"classes\":\"\",\"classed\":\"esconderTrocaZdrug\"}', 1),
(438, 39, 'text', 'EmcasodeEventoAdversoGravedesc_6', 'Em caso de Evento Adverso Grave, descreva abaixo', 12, 0, 12, '{\"label\":\"Em caso de Evento Adverso Grave, descreva abaixo\",\"placeholder\":\"\",\"minLength\":\"2\",\"maxLength\":\"99\",\"classes\":\"\"}', 1),
(439, 34, 'farmacoenxuto', 'trocadefarmaco_1', 'Fármacos antidepressivos', 11, 0, 12, '{\"label\":\"Fármacos antidepressivos\",\"options\":\"\",\"classes\":\"\",\"classesd\":\"esconderTrocaAntidepressivo\"}', 1),
(440, 35, 'farmacoenxuto', 'trocadefarmaco_2', 'Fármacos Antipsicoticos', 11, 0, 12, '{\"label\":\"Fármacos Antipsicoticos\",\"options\":\"\",\"classes\":\"\",\"classesd\":\"esconderTrocaAntipsicotico\"}', 1),
(441, 33, 'farmacoenxuto', 'trocadefarmaco_3', 'Fármacos Anticonvulsivantes', 11, 0, 12, '{\"label\":\"Fármacos Anticonvulsivantes\",\"options\":\"\",\"classes\":\"\",\"classesd\":\"esconderTrocaConvulsivante\"}', 1),
(442, 36, 'farmacoenxuto', 'trocadefarmaco_4', 'Fármacos Benzodiazepínicos', 11, 0, 12, '{\"label\":\"Fármacos Benzodiazepínicos\",\"options\":\"\",\"classes\":\"\",\"classesd\":\"esconderTrocaBenzodiazepinico\"}', 1),
(443, 39, 'farmacoenxuto', 'trocadefarmaco_5', 'Fármacos Z-Drugs', 11, 0, 12, '{\"label\":\"Fármacos Z-Drugs\",\"options\":\"\",\"classes\":\"\",\"classesd\":\"esconderTrocaZdrug\"}', 1),
(444, 37, 'farmacoenxuto', 'trocadefarmaco_6', 'Fármacos Psicoestimulantes', 11, 0, 12, '{\"label\":\"Fármacos Psicoestimulantes\",\"options\":\"\",\"classes\":\"\",\"classesd\":\"esconderTrocaPsicoestimulante\"}', 1),
(445, 41, 'farmacoenxuto', 'trocadefarmaco_7', 'Outros Fármacos', 11, 0, 12, '{\"label\":\"Outros Fármacos\",\"options\":\"\",\"classes\":\"\",\"classesd\":\"esconderTrocaOutros\"}', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `forms`
--

CREATE TABLE `forms` (
  `formId` int NOT NULL,
  `nome` varchar(32) NOT NULL,
  `tipo` varchar(32) NOT NULL DEFAULT 'first',
  `paginas` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `forms`
--

INSERT INTO `forms` (`formId`, `nome`, `tipo`, `paginas`) VALUES
(1, 'Cadastro de paciente', 'first', 16),
(2, 'Formulário Pós Internação', 'after', 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `logUsuarios`
--

CREATE TABLE `logUsuarios` (
  `lUId` int NOT NULL,
  `userId` int NOT NULL,
  `acao` varchar(32) NOT NULL,
  `corpo` varchar(1024) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `criadoEm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `logUsuarios`
--

INSERT INTO `logUsuarios` (`lUId`, `userId`, `acao`, `corpo`, `ip`, `criadoEm`) VALUES
(109, 1, 'login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:121.0) Gecko/20100101 Firefox/121.0', '189.78.114.184', '2024-01-06 13:47:35'),
(110, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 13:48:58'),
(111, 1, 'getPatient', '{\"pacienteId\":6}', '189.78.114.184', '2024-01-06 13:48:59'),
(112, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"13\"}', '189.78.114.184', '2024-01-06 13:49:02'),
(113, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 14:34:31'),
(114, 1, 'getPatient', '{\"pacienteId\":6}', '189.78.114.184', '2024-01-06 14:34:33'),
(115, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"13\"}', '189.78.114.184', '2024-01-06 14:34:36'),
(116, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"13\"}', '189.78.114.184', '2024-01-06 14:34:44'),
(117, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"13\"}', '189.78.114.184', '2024-01-06 14:42:46'),
(118, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"13\"}', '189.78.114.184', '2024-01-06 14:42:51'),
(119, 1, 'newFormPatient', '{\"pFId\":14,\"patientId\":6}', '189.78.114.184', '2024-01-06 14:42:57'),
(120, 1, 'endFormPatient', '{\"pFId\":14,\"patientId\":6}', '189.78.114.184', '2024-01-06 14:42:57'),
(121, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 14:42:58'),
(122, 1, 'getPatient', '{\"pacienteId\":6}', '189.78.114.184', '2024-01-06 14:43:01'),
(123, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"14\"}', '189.78.114.184', '2024-01-06 14:43:03'),
(124, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"14\"}', '189.78.114.184', '2024-01-06 14:43:07'),
(125, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"14\"}', '189.78.114.184', '2024-01-06 14:48:40'),
(126, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"14\"}', '189.78.114.184', '2024-01-06 14:49:41'),
(127, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"14\"}', '189.78.114.184', '2024-01-06 14:50:05'),
(128, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"14\"}', '189.78.114.184', '2024-01-06 14:50:29'),
(129, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"14\"}', '189.78.114.184', '2024-01-06 14:52:05'),
(130, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"14\"}', '189.78.114.184', '2024-01-06 14:52:23'),
(131, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"14\"}', '189.78.114.184', '2024-01-06 14:52:48'),
(132, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"14\"}', '189.78.114.184', '2024-01-06 14:54:07'),
(133, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"14\"}', '189.78.114.184', '2024-01-06 14:55:05'),
(134, 1, 'newFormPatient', '{\"pFId\":15,\"patientId\":6}', '189.78.114.184', '2024-01-06 14:55:18'),
(135, 1, 'endFormPatient', '{\"pFId\":15,\"patientId\":6}', '189.78.114.184', '2024-01-06 14:55:18'),
(136, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 14:55:20'),
(137, 1, 'getPatient', '{\"pacienteId\":6}', '189.78.114.184', '2024-01-06 14:55:24'),
(138, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"15\"}', '189.78.114.184', '2024-01-06 14:55:25'),
(139, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"15\"}', '189.78.114.184', '2024-01-06 15:07:05'),
(140, 1, 'newFormPatient', '{\"pFId\":16,\"patientId\":6}', '189.78.114.184', '2024-01-06 15:07:27'),
(141, 1, 'endFormPatient', '{\"pFId\":16,\"patientId\":6}', '189.78.114.184', '2024-01-06 15:07:27'),
(142, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 15:07:28'),
(143, 1, 'getPatient', '{\"pacienteId\":6}', '189.78.114.184', '2024-01-06 15:07:31'),
(144, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"16\"}', '189.78.114.184', '2024-01-06 15:07:44'),
(145, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"16\"}', '189.78.114.184', '2024-01-06 15:07:49'),
(146, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"16\"}', '189.78.114.184', '2024-01-06 15:13:05'),
(147, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"16\"}', '189.78.114.184', '2024-01-06 15:14:03'),
(148, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"16\"}', '189.78.114.184', '2024-01-06 15:14:27'),
(149, 1, 'newFormPatient', '{\"pFId\":17,\"patientId\":6}', '189.78.114.184', '2024-01-06 15:15:10'),
(150, 1, 'endFormPatient', '{\"pFId\":17,\"patientId\":6}', '189.78.114.184', '2024-01-06 15:15:10'),
(151, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 15:15:12'),
(152, 1, 'getPatient', '{\"pacienteId\":6}', '189.78.114.184', '2024-01-06 15:15:14'),
(153, 1, 'getPatientFBody', '{\"pacienteId\":6,\"pFId\":\"17\"}', '189.78.114.184', '2024-01-06 15:15:15'),
(154, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 15:15:34'),
(155, 1, 'newPatient', '7', '189.78.114.184', '2024-01-06 15:16:48'),
(156, 1, 'newFormPatient', '{\"pFId\":18,\"patientId\":7}', '189.78.114.184', '2024-01-06 15:16:48'),
(157, 1, 'endFormPatient', '{\"pFId\":18,\"patientId\":7}', '189.78.114.184', '2024-01-06 15:16:48'),
(158, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 15:16:49'),
(159, 1, 'getPatient', '{\"pacienteId\":7}', '189.78.114.184', '2024-01-06 15:16:50'),
(160, 1, 'getPatientFBody', '{\"pacienteId\":7,\"pFId\":\"18\"}', '189.78.114.184', '2024-01-06 15:16:52'),
(161, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 15:16:55'),
(162, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 15:16:59'),
(163, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 15:17:02'),
(164, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 15:17:05'),
(165, 1, 'getPatient', '{\"pacienteId\":7}', '189.78.114.184', '2024-01-06 15:17:06'),
(166, 1, 'getPatientFBody', '{\"pacienteId\":7,\"pFId\":\"18\"}', '189.78.114.184', '2024-01-06 15:17:10'),
(167, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 15:18:16'),
(168, 1, 'getPatient', '{\"pacienteId\":7}', '189.78.114.184', '2024-01-06 15:18:18'),
(169, 1, 'newFormPatient', '{\"pFId\":19,\"patientId\":7}', '189.78.114.184', '2024-01-06 15:18:51'),
(170, 1, 'endFormPatient', '{\"pFId\":19,\"patientId\":7}', '189.78.114.184', '2024-01-06 15:18:51'),
(171, 1, 'listPatients', '', '189.78.114.184', '2024-01-06 15:18:52'),
(172, 1, 'getPatient', '{\"pacienteId\":7}', '189.78.114.184', '2024-01-06 15:18:54'),
(173, 1, 'getPatientFBody', '{\"pacienteId\":7,\"pFId\":\"19\"}', '189.78.114.184', '2024-01-06 15:18:55'),
(174, 1, 'getPatientFBody', '{\"pacienteId\":7,\"pFId\":\"18\"}', '189.78.114.184', '2024-01-06 15:18:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacienteForm`
--

CREATE TABLE `pacienteForm` (
  `pFId` int NOT NULL,
  `pacienteId` int NOT NULL,
  `formId` int NOT NULL,
  `finalizado` tinyint(1) NOT NULL DEFAULT '0',
  `criadoEm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finalizadoEm` datetime NOT NULL DEFAULT '2100-01-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `pacienteForm`
--

INSERT INTO `pacienteForm` (`pFId`, `pacienteId`, `formId`, `finalizado`, `criadoEm`, `finalizadoEm`) VALUES
(18, 7, 1, 1, '2024-01-06 15:16:48', '2024-01-06 15:16:48'),
(19, 7, 2, 1, '2024-01-06 15:18:51', '2024-01-06 15:18:51');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacienteFormResposta`
--

CREATE TABLE `pacienteFormResposta` (
  `pFRId` int NOT NULL,
  `pFId` int NOT NULL,
  `cId` int NOT NULL,
  `respostaSearchable` varchar(32) NOT NULL,
  `resposta` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `pacienteFormResposta`
--

INSERT INTO `pacienteFormResposta` (`pFRId`, `pFId`, `cId`, `respostaSearchable`, `resposta`) VALUES
(334, 18, 209, 'Não', 'Não'),
(335, 18, 213, 'Não', 'Não'),
(336, 18, 218, 'Não', 'Não'),
(337, 18, 221, 'Sim', 'Sim'),
(338, 18, 222, 'Sim', 'Sim'),
(339, 18, 224, ' \nDiagnóstico (CID10):: 111 / Id', ' \nDiagnóstico (CID10):: 111 / Idade diagnosticado:: 13'),
(340, 18, 225, 'Sim', 'Sim'),
(341, 18, 226, '22', '22'),
(342, 18, 227, '11', '11'),
(343, 18, 228, 'Sim', 'Sim'),
(344, 18, 230, ' \nMétodo da tentativa:: 122 / Id', ' \nMétodo da tentativa:: 122 / Idade:: 11'),
(345, 18, 232, '65', '65'),
(346, 18, 233, '165', '165'),
(347, 18, 234, '44', '44'),
(348, 18, 236, 'Álcool', 'Álcool'),
(349, 18, 242, '16', '16'),
(350, 18, 243, '25', '25'),
(351, 18, 244, '3', '3'),
(352, 18, 250, 'Juliana Lee', 'Juliana Lee'),
(353, 18, 251, '1234', '1234'),
(354, 18, 252, '2000-01-01', '2000-01-01'),
(355, 18, 253, 'Feminino', 'Feminino'),
(356, 18, 254, 'Solteiro(a)', 'Solteiro(a)'),
(357, 18, 255, 'São Paulo', 'São Paulo'),
(358, 18, 256, 'Limeira', 'Limeira'),
(359, 18, 258, 'Sim', 'Sim'),
(360, 18, 259, 'CAPS', 'CAPS'),
(361, 18, 261, 'Não', 'Não'),
(362, 18, 293, 'Não', 'Não'),
(363, 19, 427, 'Z-drug', 'Z-drug'),
(364, 19, 430, 'Zdrug1', 'Zdrug1'),
(365, 19, 431, '333', '333'),
(366, 19, 432, '11', '11'),
(367, 19, 433, '22', '22'),
(368, 19, 434, '33', '33'),
(369, 19, 435, 'nenhum', 'nenhum'),
(370, 19, 436, 'Sim', 'Sim'),
(371, 19, 437, 'Falha terapêutica', 'Falha terapêutica'),
(372, 19, 443, ' \nFármaco :: f1 / Intervalo de d', ' \nFármaco :: f1 / Intervalo de dose :: 1 / Resposta :: Parcial \nFármaco :: f2 / Intervalo de dose :: 2 / Resposta :: Total');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `pacienteId` int NOT NULL,
  `nome` varchar(64) NOT NULL,
  `registroHC` decimal(10,0) UNSIGNED ZEROFILL NOT NULL COMMENT 'é só numero',
  `nascimento` date NOT NULL DEFAULT '2000-01-01',
  `genero` varchar(16) NOT NULL,
  `estadoCivil` varchar(32) NOT NULL,
  `estado` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cidade` varchar(64) NOT NULL,
  `criadoEm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `pacientes`
--

INSERT INTO `pacientes` (`pacienteId`, `nome`, `registroHC`, `nascimento`, `genero`, `estadoCivil`, `estado`, `cidade`, `criadoEm`) VALUES
(7, 'Juliana Lee', 0000001234, '2000-01-01', 'Feminino', 'Solteiro(a)', 'São Paulo', 'Limeira', '2024-01-06 15:16:48');

-- --------------------------------------------------------

--
-- Estrutura para tabela `paginas`
--

CREATE TABLE `paginas` (
  `pId` int NOT NULL,
  `formId` int NOT NULL,
  `identificador` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ordem` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `paginas`
--

INSERT INTO `paginas` (`pId`, `formId`, `identificador`, `ordem`) VALUES
(17, 1, 'antecedentesCirurgicos.json', 8),
(18, 1, 'antecedentesClinicos1.json', 6),
(19, 1, 'antecedentesClinicos2.json', 7),
(20, 1, 'antecedentesPsiquiatricos.json', 5),
(21, 1, 'dadosAntopometricos.json', 3),
(22, 1, 'historicoUso.json', 4),
(23, 1, 'identificacao1.json', 1),
(24, 1, 'identificacao2.json', 2),
(25, 1, 'medicacaoClinica.json', 17),
(26, 1, 'psicofarmacoAntidepressivo.json', 10),
(27, 1, 'psicofarmacos1.json', 9),
(28, 1, 'psicofarmacosAnticonvulsivante.json', 12),
(29, 1, 'psicofarmacosAntipsicoticos.json', 11),
(30, 1, 'psicofarmacosBenzodiazepinicos.json', 13),
(31, 1, 'psicofarmacosPsicoestimulante.json', 15),
(32, 1, 'psicofarmacosZDrugs.json', 14),
(33, 2, 'anticonvulsivante.json', 4),
(34, 2, 'antidepressivo.json', 2),
(35, 2, 'antipsicotico.json', 3),
(36, 2, 'benzodiazepinico.json', 5),
(37, 2, 'psicoestimulante.json', 7),
(38, 2, 'tratamentoFarmacologico.json', 1),
(39, 2, 'zdrug.json', 6),
(40, 1, 'psicofarmacoOutros.json', 16),
(41, 2, 'outros.json', 8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tokenUsuario`
--

CREATE TABLE `tokenUsuario` (
  `tokenId` int NOT NULL,
  `userId` int NOT NULL,
  `tokenKey` varchar(128) NOT NULL,
  `lastIp` varchar(40) NOT NULL,
  `lastUA` varchar(128) NOT NULL,
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `validUntil` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tokenUsuario`
--

INSERT INTO `tokenUsuario` (`tokenId`, `userId`, `tokenKey`, `lastIp`, `lastUA`, `createTime`, `validUntil`) VALUES
(1, 1, 'afa3902797d4568694785eb94d56f75f16e6938d4828777e25bc0043a63e4ccf0e5de3e2279dac0972bcce3797bf69d55bfd87330bfc2e95850206151bc595e1', '177.103.49.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', '2023-11-28 16:57:40', '2023-11-29 08:57:40'),
(2, 1, '2fb877f38ad1a1a1b3d56af4a6950c5bb0367c997b35a716e5d529aaa817d4cd4da9e93fea2c81c017d8ec44230591936828988588e4941c9d49d8718b0cce3f', '177.103.49.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', '2023-11-28 17:10:27', '2023-11-29 09:10:27'),
(3, 1, '11745c58a143a82489078c665ff532a0415fceb4e1f50452e8e7da852eb5dbaf3aeca483a4dd55c10675226ee9208d09079ef63778b3c920c0b676d14956f873', '177.103.49.77', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2023-11-28 17:24:59', '2023-11-29 09:24:59'),
(4, 1, 'f47557465574d48e3e38ef86aababaa40bf839965244b3bfa8277faed97b7875f956350bf59bcec206c227f6c655dd546512625c7f682245d41308733a365128', '177.103.49.77', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2023-11-28 18:52:41', '2023-11-29 10:52:41'),
(5, 1, '2671396b9a0504dbb7b411cc5e435b86c9a6eb787b5373df8871c1ce9fa7741415b8f402c0d6727b504dabe44317a4f84ff616014a06d90cc498c9293173c470', '177.103.49.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', '2023-11-28 20:24:21', '2023-11-29 12:24:21'),
(6, 1, '545906a2dc261dc157a203ee2eedb9b99f2301cbf03cd280e9002821649991f91aeed67b81754631192711dbb56addc8a7d1e187391e1bfc64ca385360cf2680', '177.63.213.183', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', '2023-11-30 21:14:56', '2023-12-01 13:14:56'),
(7, 1, '17f4a8b6a60c7c12d26844f945c57289da47b748f2672ac37350e06570b2274bae921361cfa44b1e45d52ce80be5e99812e8ad7589f6664adbefa8bcf7660792', '177.63.213.183', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Mobile Safari/537.36', '2023-11-30 21:37:50', '2023-12-01 13:37:50'),
(8, 1, '7c147cfedcc2b59501bbefc8e801bf13ec0f1602c20b637588f51a95464ec78aade9edff6c20eb0f743e9136f084eb08008fab432adecd615d5441ed962970f1', '177.102.249.32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', '2023-12-13 14:35:45', '2023-12-14 06:35:45'),
(9, 1, '2a9c8d9adf15c027cb98b1386c50f02398a6f56f9198543d46768a66d3af486793841b748e6f1150cb1cdd217ddf007783f34b991808287a9e18c79d25fed081', '200.158.224.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', '2023-12-16 14:31:48', '2023-12-17 06:31:48'),
(10, 1, '538fd0151e0a53b5ed9883ea99a834371be4ef5598ba031b7dc3cb6d48bf664f1d191fba129bc69e655c0fe93f9e1870cadf32fd7fa1d45072ec951cc4a30d2a', '200.158.224.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', '2023-12-16 16:08:02', '2023-12-17 08:08:02'),
(11, 1, '78a5a79db97cc7a63f74dc8cf05c97ecf85b34ddd93f0155956b93a327ab0e113c6823ef3b7aeb8236b659e8cdadb106f897d569214d72809d461f142b18c63b', '200.158.224.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', '2023-12-16 16:20:33', '2023-12-17 08:20:33'),
(12, 1, 'fa04efd5a7530c4b7f17b0a910a8b11c18ccab8da6e5f93d9d5c2cdd3520d5f208a71a1e9c2f1a63a425ad9668e17a4ac0eeb29cf02d684f36761fb6317be609', '200.158.224.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', '2023-12-16 16:25:06', '2023-12-17 08:25:06'),
(13, 1, '7459ea22f2495090c08699476e288dd528f28c254f9f644dab93dad57b8dd4eb39f3143ee66dac6ff319fc363e1ba9bf96bd7b4c61ded94287fd1b3c2dc6a62e', '200.158.224.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', '2023-12-16 16:33:55', '2023-12-17 08:33:55'),
(14, 1, 'a36655538e90df0bc7a674922ebef8ca673a0f8c5e52269c17622c6f92af422eadf65939fb3143a39c8694a5bc4815518365d30c8a8a68a1d65d5f014cc18d6d', '191.204.182.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', '2023-12-18 22:29:45', '2023-12-19 14:29:45'),
(15, 1, '82db08aaa3094e04b7ef5cce696fd120dc9b5091ca1f0a93470235e32582474aa7d2853ed7e199b0db1f0ff9d2f171a29f55f384c4a411ee3d89fd2eb364d027', '191.204.182.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', '2023-12-20 11:25:41', '2023-12-21 03:25:41'),
(16, 1, '38e61afddf070ce8a7496d59455dbc6245d4f30e0417b1f7b8dad81ac7d99303eed823fd78ae08168eff99dbeb22b74d118e83f28d3f955d153ca02ab1afdf11', '189.78.114.184', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:121.0) Gecko/20100101 Firefox/121.0', '2024-01-06 13:47:35', '2024-01-07 05:47:35');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `userId` int NOT NULL,
  `nome` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `senha` varchar(128) NOT NULL,
  `tipo` varchar(16) NOT NULL DEFAULT 'comum',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `vistoPorUltimo` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `criadoEm` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`userId`, `nome`, `email`, `senha`, `tipo`, `ativo`, `vistoPorUltimo`, `criadoEm`) VALUES
(1, 'Juliana', 'ju@zouli.work', 'c9839deccba6ef29c6a01df673af7cd5ccc742e780d19a8db9fc3adf8f9b2860178ac72e8eb4cf8fe06fe2e8e468662b0949739705f77c906880fb00acbaa150', 'admin', 1, '2024-01-06 15:18:54', '2023-11-28 16:32:09');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `campos`
--
ALTER TABLE `campos`
  ADD PRIMARY KEY (`cId`),
  ADD KEY `fieldName` (`fieldName`),
  ADD KEY `row` (`row`),
  ADD KEY `col` (`col`),
  ADD KEY `ativo` (`ativo`),
  ADD KEY `fk_campos_pId` (`pId`);

--
-- Índices de tabela `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`formId`);

--
-- Índices de tabela `logUsuarios`
--
ALTER TABLE `logUsuarios`
  ADD PRIMARY KEY (`lUId`),
  ADD KEY `acao` (`acao`),
  ADD KEY `fk_logUsuarios_userId` (`userId`);

--
-- Índices de tabela `pacienteForm`
--
ALTER TABLE `pacienteForm`
  ADD PRIMARY KEY (`pFId`),
  ADD KEY `finalizado` (`finalizado`),
  ADD KEY `finalizadoEm` (`finalizadoEm`),
  ADD KEY `criadoEm` (`criadoEm`),
  ADD KEY `fk_pacienteForm_formId` (`formId`),
  ADD KEY `fk_pacienteForm_pacienteId` (`pacienteId`);

--
-- Índices de tabela `pacienteFormResposta`
--
ALTER TABLE `pacienteFormResposta`
  ADD PRIMARY KEY (`pFRId`),
  ADD KEY `respostaSearchable` (`respostaSearchable`),
  ADD KEY `fk_pacienteFormResposta_pFId` (`pFId`),
  ADD KEY `fk_pacienteFormResposta_cId` (`cId`);

--
-- Índices de tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`pacienteId`),
  ADD KEY `registroHC` (`registroHC`),
  ADD KEY `estado` (`estado`);
ALTER TABLE `pacientes` ADD FULLTEXT KEY `nome` (`nome`);

--
-- Índices de tabela `paginas`
--
ALTER TABLE `paginas`
  ADD PRIMARY KEY (`pId`),
  ADD UNIQUE KEY `identificador_2` (`identificador`),
  ADD KEY `identificador` (`identificador`),
  ADD KEY `ordem` (`ordem`),
  ADD KEY `fk_paginas_formId` (`formId`);

--
-- Índices de tabela `tokenUsuario`
--
ALTER TABLE `tokenUsuario`
  ADD PRIMARY KEY (`tokenId`),
  ADD KEY `validUntil` (`validUntil`),
  ADD KEY `fk_tokenUsuario_userId` (`userId`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `ativo` (`ativo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `campos`
--
ALTER TABLE `campos`
  MODIFY `cId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;

--
-- AUTO_INCREMENT de tabela `forms`
--
ALTER TABLE `forms`
  MODIFY `formId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `logUsuarios`
--
ALTER TABLE `logUsuarios`
  MODIFY `lUId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT de tabela `pacienteForm`
--
ALTER TABLE `pacienteForm`
  MODIFY `pFId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `pacienteFormResposta`
--
ALTER TABLE `pacienteFormResposta`
  MODIFY `pFRId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `pacienteId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `paginas`
--
ALTER TABLE `paginas`
  MODIFY `pId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `tokenUsuario`
--
ALTER TABLE `tokenUsuario`
  MODIFY `tokenId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `campos`
--
ALTER TABLE `campos`
  ADD CONSTRAINT `fk_campos_pId` FOREIGN KEY (`pId`) REFERENCES `paginas` (`pId`) ON DELETE CASCADE;

--
-- Restrições para tabelas `logUsuarios`
--
ALTER TABLE `logUsuarios`
  ADD CONSTRAINT `fk_logUsuarios_userId` FOREIGN KEY (`userId`) REFERENCES `usuarios` (`userId`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pacienteForm`
--
ALTER TABLE `pacienteForm`
  ADD CONSTRAINT `fk_pacienteForm_formId` FOREIGN KEY (`formId`) REFERENCES `forms` (`formId`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pacienteForm_pacienteId` FOREIGN KEY (`pacienteId`) REFERENCES `pacientes` (`pacienteId`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pacienteFormResposta`
--
ALTER TABLE `pacienteFormResposta`
  ADD CONSTRAINT `fk_pacienteFormResposta_cId` FOREIGN KEY (`cId`) REFERENCES `campos` (`cId`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pacienteFormResposta_pFId` FOREIGN KEY (`pFId`) REFERENCES `pacienteForm` (`pFId`) ON DELETE CASCADE;

--
-- Restrições para tabelas `paginas`
--
ALTER TABLE `paginas`
  ADD CONSTRAINT `fk_paginas_formId` FOREIGN KEY (`formId`) REFERENCES `forms` (`formId`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tokenUsuario`
--
ALTER TABLE `tokenUsuario`
  ADD CONSTRAINT `fk_tokenUsuario_userId` FOREIGN KEY (`userId`) REFERENCES `usuarios` (`userId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
