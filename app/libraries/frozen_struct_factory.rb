# frozen_string_literal: true

# Structの定義とオブジェクト生成を同時に行うためのファクトリクラス
class FrozenStructFactory
  def self.build(hash)
    Struct.new(*hash.keys).new(*hash.values.map(&:freeze)).freeze
  end
end
