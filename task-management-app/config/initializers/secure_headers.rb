# config/initializers/secure_headers.rb
Rails.application.config.secure_headers = {
  hsts: "max-age=#{1.year.to_i}",
  x_frame_options: "DENY",
  x_content_type_options: "nosniff",
  x_xss_protection: "1; mode=block",
  x_download_options: "noopen",
  x_permitted_cross_domain_policies: "none",
  referrer_policy: "strict-origin-when-cross-origin",
  csp: {
    default_src: %w['self'],
    script_src: %w['self' 'unsafe-inline' cdn.example.com],
    style_src: %w['self' 'unsafe-inline'],
    img_src: %w['self' data:],
    font_src: %w['self'],
    connect_src: %w['self'],
    object_src: %w['none'],
    media_src: %w['none'],
    frame_src: %w['none'],
    report_uri: %w[/csp_reports]
  }
}