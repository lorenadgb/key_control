if Rails.env.production?
  WickedPdf.config = { exe_path: "#{Rails.root}/bin/wkhtmltopdf-amd64", wkhtmltopdf: "#{Rails.root}/bin/wkhtmltopdf-amd64" }
else
  WickedPdf.config = {
    #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
    :layout => "pdf.html",
    :exe_path => '/usr/bin/wkhtmltopdf'
  }
end
