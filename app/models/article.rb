# 7.3.3 Validações e exibição de mensagens de erro
# Como vimos, a criação de um recurso é um processo de várias etapas. A manipulação de entrada inválida
# do usuário é outra etapa desse processo. O Rails fornece um recurso chamado validações para nos ajudar a lidar com entradas de usuário inválidas.
# As validações são regras que são verificadas antes que um objeto de modelo seja salvo. Se qualquer uma das verificações falhar, o salvamento será interrompido
# e as mensagens de erro apropriadas serão adicionadas ao errorsatributo do objeto modelo

class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
