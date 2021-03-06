SELECT Situacao.Descricao as Situa��o
	  ,CASE
		WHEN Usuario.IdTipoUsuario = 1 THEN Usuario.NomeUsuario
		ELSE 'N/A'
	   END AS 'Paciente'
	  ,Medico.CRM as 'CRM do M�dico'
	  ,Area.Descricao as �rea
      ,Usuario.Email 
	  ,Prontuario.RG
	  ,Prontuario.Endereco as Endere�o
	  ,Prontuario.Nascimento as 'Data de nascimento'
	  ,DATEDIFF(YY, Prontuario.Nascimento, GETDATE()) -
		CASE
			WHEN DATEADD(YY, DATEDIFF(YY,Prontuario.Nascimento,GETDATE()),Prontuario.Nascimento) 
			> GETDATE() THEN 1
			ELSE 0
		END AS Idade
	  ,Consulta.DataConsulta as 'Data da Consulta'
FROM
Consulta
INNER JOIN
Situacao ON Situacao.IdSituacao = Consulta.IdSituacao
INNER JOIN
Medico ON Medico.IdMedico = Consulta.IdMedico 
INNER JOIN
Prontuario ON Prontuario.IdProntuario = Consulta.IdProntuario
INNER JOIN
Usuario ON Usuario.IdUsuario = Prontuario.IdUsuario
INNER JOIN
Area ON Medico.IdArea = Area.IdArea