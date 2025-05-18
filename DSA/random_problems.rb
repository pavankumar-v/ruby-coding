# get all even numbers from an array
def even_numbers(arr)
  return arr.select do |num|
    num % 2 == 0
  end
end

# p even_numbers([1, 2, 3, 4, 5, 6, 7])


# 2. Given a list of names, count how many times each name appears:
# ["Alice", "Bob", "Alice", "Charlie", "Bob", "Alice"]

def count_names(names)
  names_count = {}

  names.each do |name|
    names_count[name] ||= 0
    names_count[name] += 1
  end

  names_count
end

# p count_names(["Alice", "Bob", "Alice", "Charlie", "Bob", "Alice"])

# input
# {
#   "device" => {
#     "id" => 1,
#     "config" => {
#       "ip" => "192.168.1.1",
#       "mode" => "dhcp"
#     }
#   }
# }
#

# output
# {
#   "device.id" => 1,
#   "device.config.ip" => "192.168.1.1",
#   "device.config.mode" => "dhcp"
# }

def flatten_hash(hash, prefix = nil, output = {})
  hash.each do |key, value|
    full_key = !prefix ? key : "#{prefix}.#{key}"

    if value.is_a?(Hash)
      flatten_hash(value, full_key, output)
    else
      output[full_key] = value
    end
  end

  output
end

p flatten_hash(
  {
    "foo": :bar,
    "device" => {
      "id" => 1,
      "config" => {
        "ip" => "192.168.1.1",
        "mode" => "dhcp"
      }
    }
  }
)


# flatten array
# [1, [2, 3 , [4]], 5]
# o/p = [1, 2, 3, 4, 5]
def flatten_arr(arr, output = [])
  arr.each do |val|
    if val.is_a?(Array)
      flatten_arr(val, output)
    else
      output << val
    end
  end

  output
end

p flatten_arr([1, [2, [3, [4]], 5], 6])

# Flatten Complex
# input
# {
#   "device" => {
#     "id" => 1,
#     "interfaces" => [
#       {"name" => "eth0", "ip" => "192.168.1.2"},
#       {"name" => "eth1", "ip" => "192.168.1.3"}
#     ]
#   }
# }
#
# output
# {
#   "device.id" => 1,
#   "device.interfaces.0.name" => "eth0",
#   "device.interfaces.0.ip" => "192.168.1.2",
#   "device.interfaces.1.name" => "eth1",
#   "device.interfaces.1.ip" => "192.168.1.3"
# }

def flatten_complex(obj, prefix = nil, output = {})
  case obj
  when Hash
    # regular
    obj.each do |key, val|
      full_key = prefix ? "#{prefix}.#{key}" : key
      flatten_complex(val, full_key, output)
    end
  when Array
    obj.each_with_index do |val, index|
      full_key = "#{prefix}.#{index}"
      flatten_complex(val, full_key, output)
    end
  else
    # primitive value
    output[prefix] = obj
  end

  output
end

puts flatten_complex(
  {
    "network" => 1,
    "networks" => [ { id: 1, name: "network 1"}, { id: 2, name: "network 2"} ],
    "device" => {
      "id" => 1,
      "interfaces" => [
        {"name" => "eth0", "ip" => "192.168.1.2"},
        {"name" => "eth1", "ip" => "192.168.1.3"},
        1
      ]
    }
  }
)

# Unflatten a dot notation dictionary back into nested structure.
# input
{
  "device.id" => 1,
  "device.interfaces.0.name" => "eth0",
  "device.interfaces.0.ip" => "192.168.1.2",
  "device.interfaces.1.name" => "eth1",
  "device.interfaces.1.ip" => "192.168.1.3"
}

# output
{
  "device" => {
    "id" => 1,
    "interfaces" => [
      {"name" => "eth0", "ip" => "192.168.1.2"},
      {"name" => "eth1", "ip" => "192.168.1.3"}
    ]
  }
}

def unflatten_complex_hash(hash)
  output = {}

  hash.each do |key, val|
    keys = key.to_s.split(".")
    current = output

    keys.each_with_index do |c_key, index|
      is_last = index == (keys.length - 1) # determine last index
      is_int = c_key.match(/^\d/) # current key is int - to know if it's index

      if is_last
        if current.is_a?(Array)
          c_index = keys[index - 1].to_i
          current[c_index][c_key] = val # set value into array
        else
          current[c_key] = val
        end

        next
      end

      if is_int
        current[c_key.to_i] ||= {}
        next
      end

      is_int = keys[index + 1].match(/^\d/)

      current[c_key] ||= is_int ? [] : {}
      current = current[c_key]
    end
  end

  output
end

p unflatten_complex_hash(
  {
    "network" => 1,
    "device.id" => 1,
    "device.interfaces.0.name" => "eth0",
    "device.interfaces.0.ip" => "192.168.1.2",
    "device.interfaces.1.name" => "eth1",
    "device.interfaces.1.ip" => "192.168.1.3",
    "device.type" => "modem",
    "root.address" => "192.168.1.3"
  }
)
