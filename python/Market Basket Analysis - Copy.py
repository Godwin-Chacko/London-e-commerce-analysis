import pandas as pd
from mlxtend.frequent_patterns import apriori, association_rules

# Load the data
df = pd.read_excel("Sales Transaction with Categories.xlsx")

# Just making sure everything is clean — strip column names and key fields
df.columns = df.columns.str.strip()
df['CatName'] = df['CatName'].astype(str).str.strip()
df['TransactionNo'] = df['TransactionNo'].astype(str).str.strip()

# Categories we're interested in — just focusing on these for now
target_categories = [
    "Christmas & Holiday Merchandise",
    "Kids' Tableware, Party Decor & Modern Accessories",
    "Kitchen, Pantry & Select Home Goods",
    "Retro & Vintage Bags",
    "Retro & Vintage Kids' Items"
]

# Sanitize the category list, just in case
target_categories = [cat.strip() for cat in target_categories]

# Filter the main dataset to just the categories we're working with
df_filtered = df[df['CatName'].isin(target_categories)].copy()

# Double check if the filtered data looks good
print(f"Total transactions after filtering: {df_filtered['TransactionNo'].nunique()}")

# Create a pivot table for basket analysis — one-hot encode by category
basket = df_filtered.pivot_table(
    index='TransactionNo',
    columns='CatName',
    values='ProductNo',  # We could use Quantity, but let's just count presence
    aggfunc='count'
).fillna(0)

# Convert counts to 1/0 for presence/absence
basket = basket > 0


# Quick look at the resulting basket
print("Sample of transaction-category matrix:")
print(basket.head())

# Run Apriori to find frequent itemsets
frequent_itemsets = apriori(basket, min_support=0.01, use_colnames=True)

# Generate the association rules
rules = association_rules(frequent_itemsets, metric="lift", min_threshold=1.0)

# Sort rules by confidence and take a look at the top ones
rules_sorted = rules.sort_values(by='confidence', ascending=False)



print(rules_sorted[['antecedents', 'consequents', 'support', 'confidence', 'lift']].to_string(index=False))

