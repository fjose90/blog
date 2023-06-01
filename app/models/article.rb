# 7.3.3 Validações e exibição de mensagens de erro
# Como vimos, a criação de um recurso é um processo de várias etapas. A manipulação de entrada inválida
# do usuário é outra etapa desse processo. O Rails fornece um recurso chamado validações para nos ajudar a lidar com entradas de usuário inválidas.
# As validações são regras que são verificadas antes que um objeto de modelo seja salvo. Se qualquer uma das verificações falhar, o salvamento será interrompido
# e as mensagens de erro apropriadas serão adicionadas ao errorsatributo do objeto modelo

class Article < ApplicationRecord
  include Visible

  after_initialize :assign_account_id

  def assign_account_id
    ext_id = nil
    ext_id = generate_id while ext_id.nil? || Article.where(ext_id:).first
    self.ext_id = ext_id
  end

  def generate_id
    id = ['A']
    5.times { id << SecureRandom.random_number(9) }
    id = id.join
  end

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
