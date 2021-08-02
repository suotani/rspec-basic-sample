class CalcsController < ApplicationController

  def new
  end


  def exec
    input = params[:input]

    @result = input.split(" ").map(&:to_i).sum
    render "new"

  end

  def exec2
    # 1. routes.rb編集 新しくルーティングを追加
    # 2. new.html.erbを編集 新しく追加したurlにアクセスする様に編集
    input = params[:input]


    # 足し算じゃなくて、掛け算する
    @result = input.split(" ").map(&:to_i)
    @result = @result[0] * @result[1]
    render "new"
  end


  def exec3
    input = params[:input].to_i # 100
    taxes = Tax.all
    @taxed_values = []
    taxes.each do |tax| #tax = <Tax id: 1, rate: 5, name: "5%", created_at: "2021-07-28 05:33:09", updated_at: "2021-07-28 05:33:09">
      @taxed_values.push(input * (1 + tax.rate / 100.0))
    end
  end

  def exec4
    @input = params[:input].to_i
    @taxes = Tax.all
  end

end
