require 'nokogiri'
require 'selenium-webdriver'

# Selenium設定
options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless=new')
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')

driver = Selenium::WebDriver.for(
  :remote,
  url: "http://#{ENV['SELENIUM_HOST']}:4444/wd/hub",
  options: options
)

begin
  # 対象サイトにアクセス
  driver.get(ENV['TARGET_URL'])

  # ページロード待機（最大30秒）
  wait = Selenium::WebDriver::Wait.new(timeout: 30)
  xpath = '//*/div[1]/div/div[2]/div[3]/div/div[1]'
  wait.until { driver.find_element(:xpath, xpath) }

  # ページ解析
  doc = Nokogiri::HTML(driver.page_source)

  # コラム記事の抽出
  articles = []
  doc.xpath('/html/body/div[1]/div/div[2]/div[3]/div/div[1]/section[*]/div[2]/div/div[*]/div').each do |container|
    articles.push({
      title: container.xpath('./div/div[2]//div/div/div/p/a/span').first.text.strip,
      url: container.xpath('./div/div[2]//div/div/div/p/a').first['href'].strip,
      summary: container.xpath('./div/div[3]//div/div/div/p/a/span').first.text.strip
    }) rescue next
  end

  # 結果出力
  articles.each.with_index(1) do |article, i|
    puts "\n記事#{i}:"
    puts "タイトル: #{article[:title]}"
    puts "URL: #{article[:url]}"
    puts "概要: #{article[:summary]}"
  end

rescue => e
  puts "エラーが発生しました: #{e.message}"
ensure
  driver.quit
end
