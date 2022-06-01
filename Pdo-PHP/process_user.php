<?php
require_once 'connect-db.php';

if (!empty($_POST)) {

    try {
        
        $sql = "INSERT INTO usuario
                    (nome, data_nascimento, telefone, email, senha)
                VALUES
                    (:nome, :dataNascimento, :telefone, :email, :senha)";
        
        $stmt = $pdo->prepare($sql);

        $dados = array(
            ':nome' => $_POST['nome'],
            ':dataNascimento' => $_POST['dataNascimento'],
            ':telefone' => $_POST['telefone'],
            ':email' => $_POST['email'],
            ':senha' => md5($_POST['senha'])
        );

        if($stmt->execute($dados)) {
            header("Location: index.php?msgSucesso=Cadastro realizado com suceso!");
        }      

    } catch (PDOException $e) {
        header("Location: index.php?msgSucesso=Falha ao cadastrar...!");
    }
}
else  {
    header("Location: index.php?msgErro=Erro de acesso.");
}
DIE();

/*
echo '<pre>';
print_r($_POST);
echo '</pre>';
*/



?>