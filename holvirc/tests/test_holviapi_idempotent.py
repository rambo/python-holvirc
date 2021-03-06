import os

import holvirc
import pytest
from holviapi.tests.test_api_idempotent import test_get_invoice, test_list_invoices

from .fixtures import categoriesapi, connection, invoicesapi, productsapi

pytestmark = pytest.mark.skipif((not os.environ.get('HOLVI_POOL') or not os.environ.get('HOLVI_USER') or not os.environ.get('HOLVI_PASSWORD')), reason="HOLVI_POOL, HOLVI_USER and HOLVI_PASSWORD must be in ENV for these tests")


def test_list_income_categories(categoriesapi):
    l = categoriesapi.list_income_categories()
    c = next(l)
    assert type(c) == holvirc.IncomeCategory


def test_list_expense_categories(categoriesapi):
    l = categoriesapi.list_expense_categories()
    c = next(l)
    assert type(c) == holvirc.ExpenseCategory


def test_get_category(categoriesapi):
    l = categoriesapi.list_income_categories()
    c = next(l)
    assert type(c) == holvirc.IncomeCategory
    c2 = categoriesapi.get_category(c.code)
    assert c.code == c2.code
