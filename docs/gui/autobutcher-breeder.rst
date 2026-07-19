
gui/autobutcher-breeder
=======================

.. dfhack-tool::
    :summary: Configure attribute-selecting livestock culling.
    :tags: fort auto fps animals

This is an in-game interface for `autobutcher-breeder`, which allows you to set
female/male and juvenile/adult population targets. When a target is exceeded,
the plugin retains sexually compatible animals by comparing physical attribute
potential from weakest to strongest and marks lower-ranked animals for
slaughter. Fully tied juveniles are culled youngest-first, and fully tied
adults are culled oldest-first.
Unprotected animals without confirmed opposite-sex interest count toward the
configured target and receive first priority for slaughter when it is
exceeded. Already marked and protected animals do not count toward the target;
existing slaughter flags are preserved.

Usage
-----

::

    gui/autobutcher-breeder
