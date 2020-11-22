<div class="divMensagem"></div>
<g:formRemote name="formProduto" url="[controller: 'produto', action: 'salvar']" update="divMensagem">
    Nome <input type="text" name="nome" value="" /> <br/>
    Preço <input type="text" name="preco" value="" /> <br/>
    Qtd atual <input type="text" name="quantidade" value="" /> <br/>
    Qtd mínima <input type="text" name="quantidadeMinima" value="" /> <br/>
    <input type="submit" name="btnSalvar" value="Salvar"/>
    <input type="button" name="btnCancelar" value="Cancelar"/>
    <input type="hidden" name="id" value=""/>
</g:formRemote>