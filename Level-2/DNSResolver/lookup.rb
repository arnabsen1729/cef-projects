def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

def parse_dns(dns_raw)
  dns_raw.shift # get rid of the header line in the zone file
  dns_raw.select! { |record| record.length > 1 } # making sure there are no blank lines
  records = {}
  dns_raw.each do |record|
    # unpacking the different columns
    record_type, source, destination = record.split(", ").map { |data| data.strip }
    records[source.to_sym] = {
      :type => record_type,
      :destination => destination,
    }
  end
  return records
end

def resolve(dns_records, lookup_chain, domain)
  if dns_records[domain.to_sym] == nil
    lookup_chain.push("Domain #{domain} doesn't exist in records")
  else
    record = dns_records[domain.to_sym]
    if record[:type] == "A"
      lookup_chain.push(record[:destination])
    elsif record[:type] == "CNAME"
      resolve(dns_records, lookup_chain, record[:destination])
    else
      lookup_chain.push("Record Type invalid")
    end
  end
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
