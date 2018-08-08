"""Test that MI_ScriptingToolkit is installed."""


def main():
    """Test install of MI_ScriptingToolkit."""
    try:
        import GRANTA_MIScriptingToolkit as gdl
        print('Imported GRANTA_MIScriptingToolkit successfully.')
    except ImportError as e:
        print('Unable to import GRANTA_MIScriptingToolkit.')


if __name__ == "__main__":
    main()
