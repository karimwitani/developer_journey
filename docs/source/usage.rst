Usage
=====

.. _installation:

Installation
------------

To use Lumache, first install it using pip:

.. code-block:: console

   (.venv) $ pip install lumache

Creating recipes
----------------

To retrieve a list of random ingredients,
you can use the ``dev_journey.get_random_ingredients()`` function:

.. autofunction:: dev_journey.get_random_ingredients

The ``kind`` parameter should be either ``"meat"``, ``"fish"``,
or ``"veggies"``. Otherwise, :py:func:`dev_journey.get_random_ingredients`
will raise an exception.

.. autoexception:: dev_journey.InvalidKindError

For example:

>>> import dev_journey
>>> dev_journey.get_random_ingredients()
['shells', 'gorgonzola', 'parsley']
