import 'package:sqflite/sqflite.dart';
import 'Produto.dart';
import 'package:path/path.dart';

class Banco{
  buscarBanco()async{
    final caminhoBanco = await getDatabasesPath();
    final localBanco = join(caminhoBanco, "banco.db");

    var bancoDados = await openDatabase(
        localBanco,
        version: 1,
        onCreate: (banco, versaoRecente){
            String sql = "CREATE TABLE produtos("
                "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                "nome VARCHAR NOT NULL, "
                "marca VARCHAR NOT NULL, "
                "preco REAL NOT NULL, "
                "validade VARCHAR NOT NULL)";
            banco.execute(sql);
        }
    );
    return bancoDados;
  }

  salvar(Produto produtoSalvo)async{
    Database banco = await buscarBanco();
    Map<String, dynamic> produto = {
      "nome" : produtoSalvo.nome,
      "marca" : produtoSalvo.marca,
      "preco" : produtoSalvo.preco,
      "validade" : produtoSalvo.validade
    };
    return await banco.insert("produtos", produto);
  }
  getProdutos()async{
    Database banco = await buscarBanco();
    List produtos = await banco.rawQuery('SELECT * FROM produtos ORDER BY id asc');
    //List produtos = await banco.rawQuery("SELECT * FROM produtos WHERE nome LIKE '%LHO%'");
    //List produtos = await banco.rawQuery("SELECT * FROM produtos WHERE preco BETWEEN 100 and 199");
    //List produtos = await banco.rawQuery("SELECT * FROM produtos ORDER BY nome desc LIMIT 2");
    //List produtos = await banco.rawQuery("SELECT nome, marca FROM produtos");
    return produtos;
  }

  getProduto(int id)async{
    Database banco = await buscarBanco();
    List produto = await banco.query(
      "produtos",
      columns: ["id", "nome", "marca", "preco","validade"],
      where: "id=?",
      whereArgs: [id]
    );
    return produto.first;
  }

  alterar(Produto produto)async{
    Database banco = await buscarBanco();
    Map<String, dynamic> dadosProduto = {
      "nome" : produto.nome,
      "marca" : produto.marca,
      "preco" : produto.preco,
      "validade" : produto.validade
    };
    return await banco.update(
        "produtos",
        dadosProduto,
        where: "id=?",
        whereArgs: [produto.id]
    );
  }

  apagar(int id)async{
    Database banco = await buscarBanco();
    return await banco.delete(
      "produtos",
      where: "id=?",
      whereArgs: [id]
    );
  }
}