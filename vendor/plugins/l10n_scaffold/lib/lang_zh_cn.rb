# lang_zh_cn.rb
# Chinese baseline translation file.
# combined with Chinese scaffold support.
# Translated by Forrest Cao (Cao, Weiyuan), caoweiyuan@gmail.com



module LocalizationSimplified
  About = {
    :lang => "zh_cn",
    :updated => "2007-06-06"
  }

  class ActiveRecord
    # ErrorMessages to override default messages in 
    # +ActiveRecord::Errors::@@default_error_messages+
    # This plugin also replaces hardcoded 3 text messages 
    # :error_translation is inflected using the Rails 
    # inflector. 
    #
    # Remember to modify the Inflector with your localized translation
    # of "error" and "errors" in the bottom of this file
    # 
    ErrorMessages = {
       :inclusion => "没有包含在列表内",   
       :exclusion => "是保留的",   
       :invalid => "无效",   
       :confirmation => "确认不匹配",   
       :accepted  => "必须赋值",   
       :empty => "不能为空",   
       :blank => "不能为空",   
       :too_long => "太长 (最长 %d 个字符)",   
       :too_short => "太短 (最短 %d 个字符)",   
       :wrong_length => "长度错误 (必须 %d 个字符)",   
       :taken => "不能重复",   
       :not_a_number => "不是数字" ,  
       :must_number => "必须是数字",
      
      #Jespers additions:
      :error_translation   => "个错误",
      :error_header        => "保存该%2$s时发生%1$s", 
      :error_subheader     => "错误字段如下："
    }
  end

  # Texts to override +distance_of_time_in_words()+
  class DateHelper
    Texts = {
      :less_than_x_seconds => "不到%d秒",
      :half_a_minute       => "半分钟",
      :less_than_a_minute  => "不到1分钟",
      :one_minute          => "1分钟",
      :x_minutes           => "%d分钟",
      :one_hour            => "大约1小时",
      :x_hours             => "大约%d小时",
      :one_day             => "1天",
      :x_days              => "%d天",
      :one_month           => "1个月",
      :x_months            => "%d个月",
      :one_year            => "1年",
      :x_years             => "%d年"
    }

    # Rails uses Month names in Date and time select boxes 
    # (+date_select+ and +datetime_select+ )
    # Currently (as of version 1.1.6), Rails doesn't use daynames
    Monthnames     = [nil] + %w{一月 二月 三月 四月 五月 六月 七月 八月 九月 十月 十一月 十二月}
    AbbrMonthnames = [nil] + %w{1月 2月 3月 4月 5月 6月 7月 8月 9月 10月 11月 12月}
    Daynames       = %w{星期日 星期一 星期二 星期三 星期四 星期五 星期六}
    AbbrDaynames   = %w{周日 周一 周二 周三 周四 周五 周六}
    
    # Date and time format syntax explained in http://www.rubycentral.com/ref/ref_c_time.html#strftime
    # These are sent to strftime that Ruby's date and time handlers use internally
    # Same options as php (that has a better list: http://www.php.net/strftime )
    DateFormats = {
      :default  => "%Y年%m月%d日",
      :short    => "%b%d日",
      :long     => "%Y年 %B %d日",
      :js       => "%m %d %Y"
    }

    TimeFormats = {
      :default  => "%m月%d日 %H时%M分",
      :short    => "%b%d日 %H:%M",
      :long     => "%Y年 %B %d日（%A）%H时%M分%S秒",
      :js       => "%m %d %Y %H:%M:%S"
    }
    # Set the order of +date_select+ and +datetime_select+ boxes
    # Note that at present, the current Rails version only supports ordering of date_select boxes
    DateSelectOrder = {
      :order    => [:year, :month, :day] #default Rails is US ordered: :order => [:year, :month, :day]
    }
  end

  class NumberHelper
    # CurrencyOptions are used as default for +Number#to_currency()+
    # http://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html#M000449
    CurrencyOptions = {
      :unit      => "￥",
      :separator => ".",             #unit separator (between integer part and fraction part)
      :delimiter => ",",             #delimiter between each group of thousands. Example: 1.234.567 
      :order     => [:unit, :number] #order is at present unsupported in Rails
      #to support for instance Danish format, the order is different: Unit comes last (ex. "1.234,00 dkr.")
    }
  end

  class ArrayHelper
    # Modifies +Array#to_sentence()+
    # http://api.rubyonrails.org/classes/ActiveSupport/CoreExtensions/Array/Conversions.html#M000274
    ToSentenceTexts = {
      :connector => '和',
      :comma => '、',
      :remove_space => true,
      :skip_last_comma => false
    }
  end

  Translations = {
    "Editing %s" => "正在编辑%s",
    "Update %s" => "编辑%s",
    "Updated %s" => "%s已更新",
    "Show %s" => "显示%s",
    "Create %s" => "创建%s",
    "Created %s" => "%s已创建",
    "Create Another" => "创建下一个",
    "Add" => "添加",
    "Add Existing" => "添加现有的",
    "Replace With New" => "替换成新的",
    "New %s" => "新建%s",
    "Listing %s" => "%s列表",
    "View" => "查看",
    "Show" => "显示",
    "Back" => "返回",
    "New" => "新建",
    "Edit" => "编辑",
    "Update" => "更新",
    "Create" => "创建",
    "Previous" => "上一页",
    "Next" => "下一页",
    "Create New" => "创建",
    "Search" => "搜索",
    "Live Search" => "快速搜索",
    "Search Terms" => "搜索关键字",
    "Found" => "个结果",
    "No Entries" => "无记录",
    "Are you sure?" => "确认删除？",
    "Destroy" => "删除",
    "Delete" => "删除",
    "Remove" => "移除",
    "Cancel" => "取消",
    "Reset" => "重设",
    "Close" => "关闭",
    "hide" => "隐藏",
    "show" => "显示",
    "record" => "记录",
    "- select -" => "---",
    "True" => "是",
    "False" => "否",
    "Click to edit" => "点击编辑",
    "Loading…" => "载入中…",
    "Saving…" => "保存中…",
    "%s for %s" => "%2$s的%1$s",
    "%s was successfully created." => "成功创建%s。",
    "%s was successfully updated." => "成功更新%s。",
    "Request Failed (code 500, Internal Error)" => "请求失败（内部错误，代码500）",
    "Today" => "今天",
    "Yesterday" => "昨天",
    "This Week" => "本周",
    "Previous Week" => "上周",
    "This Quarter" => "本季",
    "Previous Quarter" => "上季",
    "This Year" => "本年",
    "Previous Year" => "上年",
    "This Month" => "本月",
    "Previous Month" => "上月",
    "Custom" => "自定义",
    "Trend" => "趋势",
    "Recent" => "最近",
    "Days" => "天",
    "Weeks" => "周",
    "Months" => "月",
    "Years" => "年"
  }

end


# Use the inflector below to pluralize "error" from
# @@default_error_messages[:error_translation] above (if necessary)
Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person people'
   inflect.uncountable %w( information 个错误)
end


