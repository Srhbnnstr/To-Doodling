class SvgController < ApplicationController

  def view
      @svg_data = Doodle.find(params[:id]).svg

      send_data(url_unescape(@svg_data),  :type => 'image/svg+xml',
                                          :filename => params[:id]+'.svg',
                                          :disposition => 'inline')
  end

  def url_unescape(string)
    string.tr('+', ' ').gsub(/((?:%[0-9a-fA-F]{2})+)/n) do
      [$1.delete('%')].pack('H*')
    end
  end

end
