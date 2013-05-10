class RelacionamentoNotificacaoDestinatario < ActiveRecord::Migration
	def change
	    create_table :notificacoes_destinatarios do |t|
	      t.integer :notificacao_id
	      t.integer :destinatario_id  
	    end
  end
end
