# -*- coding: utf-8 -*-
class InitIrmCurrency < ActiveRecord::Migration
  def self.up
    #初始化currency，删除所有的币种
    Irm::Currency.delete_all
    Irm::CurrenciesTl.delete_all
    #CNY
    cny_currency = Irm::Currency.new(:currency_code=>'CNY',
                                        :precision=>2,
                                        :not_auto_mult=>true)
    cny_currency.currencies_tls.build(:currency_id=>cny_currency.id,
                                    :name=>"人民币",
                                    :description=>"人民币",
                                    :language=>"zh",
                                    :status_code=>'ENABLED',
                                    :source_lang=>"en")
    cny_currency.currencies_tls.build(:currency_id=>cny_currency.id,
                                    :name=>"Yuan Renminbi",
                                    :description=>"Yuan Renminbi",
                                    :language=>"en",
                                    :status_code=>'ENABLED',
                                    :source_lang=>"en")
    cny_currency.save

    #USD
    usd_currency = Irm::Currency.new(:currency_code=>'USD',
                                        :precision=>2,
                                        :not_auto_mult=>true)
    usd_currency.currencies_tls.build(:currency_id=>usd_currency.id,
                                    :name=>"美元",
                                    :description=>"美元",
                                    :language=>"zh",
                                    :status_code=>'ENABLED',
                                    :source_lang=>"en")
    usd_currency.currencies_tls.build(:currency_id=>usd_currency.id,
                                    :name=>"US dollar",
                                    :description=>"US dollar",
                                    :language=>"en",
                                    :status_code=>'ENABLED',
                                    :source_lang=>"en")
    usd_currency.save

    #HKD
    hkd_currency = Irm::Currency.new(:currency_code=>'HKD',
                                        :precision=>2,
                                        :not_auto_mult=>true)
    hkd_currency.currencies_tls.build(:currency_id=>hkd_currency.id,
                                    :name=>"港币",
                                    :description=>"港币",
                                    :language=>"zh",
                                    :status_code=>'ENABLED',
                                    :source_lang=>"en")
    hkd_currency.currencies_tls.build(:currency_id=>hkd_currency.id,
                                    :name=>"Hong Kong Dollar",
                                    :description=>"Hong Kong Dollar",
                                    :language=>"en",
                                    :status_code=>'ENABLED',
                                    :source_lang=>"en")
    hkd_currency.save

    #JPY
    jpy_currency = Irm::Currency.new(:currency_code=>'JPY',
                                        :precision=>0,
                                        :not_auto_mult=>true)
    jpy_currency.currencies_tls.build(:currency_id=>jpy_currency.id,
                                    :name=>"日元",
                                    :description=>"日元",
                                    :language=>"zh",
                                    :status_code=>'ENABLED',
                                    :source_lang=>"en")
    jpy_currency.currencies_tls.build(:currency_id=>jpy_currency.id,
                                    :name=>"Yen",
                                    :description=>"Japanese yen",
                                    :language=>"en",
                                    :status_code=>'ENABLED',
                                    :source_lang=>"en")
    jpy_currency.save
  end

  def self.down
    Irm::Currency.delete_all
    Irm::CurrenciesTl.delete_all
  end
end
