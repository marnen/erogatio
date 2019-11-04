module TableHelpers
  def each_column(table, &block)
    table.transpose.hashes.each &block
  end
end

World TableHelpers
