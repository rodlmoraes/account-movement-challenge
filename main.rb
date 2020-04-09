require 'csv'

ID = 0
VALUE = 1

def apply_transactions_to_accounts(accounts_file, transactions_file)
    accounts_data = CSV.read(accounts_file)
    accounts = create_accounts_hash(accounts_data)

    transactions_data = CSV.read(transactions_file)
    puts process_transactions(accounts, transactions_data)
end

def create_accounts_hash(accounts_data)
    accounts_hash = {}
    for account in accounts_data
        id = account[ID]
        initial_balance = account[VALUE].to_i

        accounts_hash[id] = initial_balance
    end
    accounts_hash
end

def process_transactions(accounts, transactions_data)
    for transaction in transactions_data
        account_id = transaction[ID]
        transaction_value = transaction[VALUE].to_i
        
        next unless accounts[account_id]

        accounts[account_id] += transaction_value
        accounts[account_id] -= 300 if transaction_value < 0 && accounts[account_id] < 0
    end
    accounts
end

puts 'What is the ACCOUNTS file name? remember the .csv in the end of the name'
accounts_file_name = gets.strip

puts 'Alright, now what is the TRANSACTIONS file name? remember the .csv in the end of the name'
transactions_file_name = gets.strip

apply_transactions_to_accounts(accounts_file_name, transactions_file_name)
