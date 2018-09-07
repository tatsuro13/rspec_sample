require 'rails_helper'

RSpec.describe Article, type: :model do

  # it "skipの振る舞いをチェッキ" do
  #   skip 'skipします'
  #   expect(1).to eq 2
  # end
  #
  # skip '全体をskipします' do
  #   it "skipの振る舞いをチェック" do
  #     expect(1).to eq 2
  #   end
  # end
  # pending "add some examples to (or delete) #{__FILE__}"
describe '.abbreviated_title' do
  let(:article){Article.new(title: title)}
  context '記事タイトルが20文字未満の場合' do
    let(:title){ 'タイトル' }
    it '記事タイトルがそのまま返ること' do
      expect(article.abbreviated_title).to eq 'タイトル'
    end
  end
  context '記事タイトルが20文字以上の場合' do
    it '記事タイトルが省略されること' do
      article = Article.new(title: 'a' * 20)
      expect(article.abbreviated_title).to eq "#{'a'*19}…"
    end
  end
end
describe '.publish' do
  context '記事が非公開の状態の場合' do
    it '記事が公開状態になること' do
      article = Article.new(status: :draft)
      article.publish
      expect(article.published?).to be_truthy
    end
  end

  context '記事が公開状態の場合' do
    it '記事が公開状態のままであること' do
      article = Article.new(status: :published)
      article.publish
      expect(article.published?).to be_truthy
    end
  end
end
# it "pendingの振る舞いをチェッキ" do
#   pending 'pendingします'
#   expect(1).to eq 2
# end
end
