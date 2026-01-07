@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for Mass Po Uploader'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo: {
    typeName: 'Mass PO Uploader',
    typeNamePlural: 'Mass PO Uploader'
}
define root view entity ZC_MASS_PO_UPLOAD
  provider contract transactional_query
  as projection on ZI_MASS_PO_UPLOAD
{

      @UI.facet: [
       { id: 'idEndUser', purpose: #HEADER, position:  10,
         type: #DATAPOINT_REFERENCE, targetQualifier: 'tqEnduser' },

       { id: 'idChgat', purpose: #HEADER, position:  20,
         type: #DATAPOINT_REFERENCE, targetQualifier: 'tqChgat' },

       { id: 'idFile', purpose: #STANDARD, position:  40,
         label:  'File Upload', type: #IDENTIFICATION_REFERENCE }

       ]
      @UI.dataPoint: { qualifier: 'tqEnduser', title: 'Person Responsible' }
      @UI.identification: [{ type: #FOR_ACTION, label: 'PROCESS FILE DATA', dataAction: 'POUploader' }]
  key EndUser,
      @UI.lineItem: [{ position: 10, label: 'File Id' }]
  key FileId,
      @UI.lineItem: [{ position: 20, label: 'File Status' }]
      FileStatus,
      @Semantics.largeObject: {
          mimeType: 'Mimetype',
          fileName: 'Filename',
          acceptableMimeTypes: [ 'application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'  ],
          contentDispositionPreference: #INLINE
      }
      @UI.identification: [{ position: 30, label: 'Select Excel File to Upload' }]
      Attachment,
      @UI.hidden: true
      Mimetype,
      @UI.lineItem: [{ position: 40, label: 'Filename' }]
      Filename,
      @UI.hidden: true
      LocalCreatedBy,
      @UI.hidden: true
      LocalCreatedAt,
      @UI.hidden: true
      LocalLastChangedBy,
      @UI.dataPoint: { qualifier: 'tqChgat', title: 'Last Changed ' }
      LocalLastChangedAt,
      @UI.hidden: true
      LastChangedAt
}
