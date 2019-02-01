namespace :read_spreadsheet do

  desc "load office class produts"
  task fill_database_office_class: :environment do
    workbook = Roo::Spreadsheet.open('/Users/evertsalinas/Documents/Evert/verissageneral/productos_office_class.xlsx')
    sheet1 = workbook.sheet(0)
    ((sheet1.first_row + 1)..sheet1.last_row).each_with_index do |row, index|
      new = (sheet1.cell(row, 'B') == 1)
      # puts "#{new}"
      if new
        name = sheet1.cell(row, 'D')
        name.remove!("<html>")
        name.remove!("</html>")
        name.remove!("<b>")
        name.remove!("</b>")

        @name           = name
        @price          = sheet1.cell(row, 'F')
        @array = []
        counter = 1
        begin
          new_row = row + counter
          # puts "#{new_row}"
          cell_value = sheet1.cell(new_row, 'D')
          if cell_value.present? then
            @array << cell_value
          end
          counter+=1
        end while cell_value.present?

        product = Product.new(name: @name, price: @price, price_currency: "MXN", specifications: @array)
        if product.save
          puts "SUCCESS: Product with name: #{product.name} was created"
          Rails.logger.error "SUCCESS: Product with name: #{product.name} was created"
        else
          puts "ERROR: Product with name: #{product.name} couldn't be created"
          Rails.logger.error "ERROR: Product with name: #{product.name} couldn't be created"
        end
      end
    end
  end


  desc "load new form produts"
  task fill_database_new_form: :environment do
    workbook = Roo::Spreadsheet.open('/Users/evertsalinas/Documents/Evert/verissageneral/productos_newform.xlsx')
    sheet1 = workbook.sheet(0)
    ((sheet1.first_row + 1)..sheet1.last_row).each do |row|
      new   = sheet1.cell(row, 'B')
      if new == 1
        name  = sheet1.cell(row, 'D')
        name.remove!("<html>")
        name.remove!("</html>")
        name.remove!("<b>")
        name.remove!("</b>")
        price = sheet1.cell(row, 'F')
        product = Product.new(name: name, price: price, price_currency: "MXN")
        if product.save
          puts "SUCCESS: Product with name: #{name} was created"
          Rails.logger.error "SUCCESS: Product with name: #{name} was created"
        else
          puts "ERROR: Product with name: #{name} couldn't be created"
          Rails.logger.error "ERROR: Product with name: #{name} couldn't be created"
        end
      end
    end
  end

  desc "load haken produts"
  task fill_database_haken: :environment do
    workbook = Roo::Spreadsheet.open('/Users/evertsalinas/Documents/Evert/verissageneral/productos_haken.xlsx')
    sheet1 = workbook.sheet(0)
    ((sheet1.first_row + 1)..sheet1.last_row).each do |row|
      new   = sheet1.cell(row, 'B')
      if new == 1
        name  = sheet1.cell(row, 'D')
        name.remove!("<html>")
        name.remove!("</html>")
        name.remove!("<b>")
        name.remove!("</b>")
        price = sheet1.cell(row, 'F')
        product = Product.new(name: name, price: price, price_currency: "MXN")
        if product.save
          puts "SUCCESS: Product with name: #{name} was created"
          Rails.logger.error "SUCCESS: Product with name: #{name} was created"
        else
          puts "ERROR: Product with name: #{name} couldn't be created"
          Rails.logger.error "ERROR: Product with name: #{name} couldn't be created"
        end
      end
    end
  end

  desc "load techno produts"
  task fill_database_techno: :environment do
    workbook = Roo::Spreadsheet.open('/Users/evertsalinas/Documents/Evert/verissageneral/productos_techno.xlsx')
    sheet1 = workbook.sheet(0)
    ((sheet1.first_row + 1)..sheet1.last_row).each do |row|
      new   = sheet1.cell(row, 'B')
      if new == 1
        name  = sheet1.cell(row, 'D')
        name.remove!("<html>")
        name.remove!("</html>")
        name.remove!("<b>")
        name.remove!("</b>")
        price = sheet1.cell(row, 'F')
        product = Product.new(name: name, price: price, price_currency: "MXN")
        if product.save
          puts "SUCCESS: Product with name: #{name} was created"
          Rails.logger.error "SUCCESS: Product with name: #{name} was created"
        else
          puts "ERROR: Product with name: #{name} couldn't be created"
          Rails.logger.error "ERROR: Product with name: #{name} couldn't be created"
        end
      end
    end
  end

end#last
