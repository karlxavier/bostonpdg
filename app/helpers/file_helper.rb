module FileHelper

  def is_downloadable_file?(mime_type)
    mime_types = [
      'text/plain', 
      'application/pdf', 
      'application/x-rar-compressed', 
      'application/x-7z-compressed', 
      'application/zip', 
      'application/x-tar',
      'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 'application/vnd.ms-powerpoint', 'application/vnd.openxmlformats-officedocument.presentationml.presentation',
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'application/msword'
    ]

    return mime_types.include?(mime_type)
  end

  def file_icon(mime_type)
    archives = [
      'application/x-rar-compressed', 
      'application/x-7z-compressed', 
      'application/zip', 
      'application/x-tar'
    ]

    excels = [
      'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      'text/csv'
    ]

    words = [
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
      'application/msword'
    ]

    presentations = [
      'application/vnd.ms-powerpoint',
      'application/vnd.openxmlformats-officedocument.presentationml.presentation'
    ]

    return file_pdf_icon if mime_type == 'application/pdf'
    return file_archive_icon if archives.include?(mime_type)
    return file_spreadsheet_icon if excels.include?(mime_type)
    return file_word_icon if words.include?(mime_type)
    return file_presentation_icon if presentations.include?(mime_type)
    file_alt_icon
  end

  def file_alt_icon
    content_tag :i, nil, class: 'fa fa-file-alt'
  end

  def file_archive_icon
    content_tag :i, nil, class: 'fa fa-file-archive'
  end

  def file_spreadsheet_icon
    content_tag :i, nil, class: 'fa fa-file-excel'
  end

  def file_word_icon
    content_tag :i, nil, class: 'fa fa-file-word'
  end

  def file_presentation_icon
    content_tag :i, nil, class: 'fa fa-file-powerpoint'
  end

  def file_pdf_icon
    content_tag :i, nil, class: 'fa fa-file-pdf'
  end
end